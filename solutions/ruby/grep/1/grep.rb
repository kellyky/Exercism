
# Given a pattern (string), flags (array) and files (array), return the specififed match.
# What each flag means:
#   -n  Prepend line number and colon `:` to each line in the output, placing the number AFTER the filename (if present)
#   -l  Output only names of files that contain at least one matching line
#   -i  Match line using case-insensitive comparison
#   -v  Return all lines that *fail* to match. Like an invert
#   -x  Search only for lines where search string ('pattern') matches the entire line

class Grep

  FLAGS = {
    '-n' => :line_number_prefix_needed,
    '-l' => :file_names_only,
    '-i' => :case_insensitive,
    '-v' => :invert_match,
    '-x' => :complete_line_match,
  }

  def self.grep(pattern, flags, files)
    file_name_needed = multiple_files_searched?(files)

    new_grepper = new(flags, pattern)

    file_matches = []
    files.each do |file|
      file_match = new_grepper.grep(file, files.count)
      file_matches << file_match unless file_match.empty?
    end
    file_matches.join("\n")
  end

  def self.multiple_files_searched?(files)
    files.count > 1
  end

  private_constant :FLAGS

  private

  attr_accessor :pattern,
                :file_name_prefix_needed,
                :case_insensitive,
                :line_number_prefix_needed,
                :file_names_only,
                :invert_match,
                :complete_line_match

  def initialize(flags, raw_pattern)
    # Set defaults
    self.file_name_needed = false
    self.pattern = raw_pattern

    # Toggle flags, update pattern if needed
    toggle_flags(flags)
    update_pattern if case_insensitive || complete_line_match
  end

  def toggle_flags(flags)
    FLAGS.each do |flag, attribute|
      bool = flags.include?(flag) ? true : false
      send("#{attribute}=", bool)
    end
  end

  def update_pattern
    self.pattern = if case_insensitive
                     /#{pattern}/i
                   elsif complete_line_match
                     /\A#{pattern}\z/
                   end
  end

  def file_name_prefix
    file_name_needed ? file + ':' : ''
  end

  def line_number_prefix(n)
    line_number_prefix_needed ? "#{n}:" : ''
  end

  public

  attr_accessor :file, :file_name_needed

  def grep(file, file_count)
    self.file = file
    file_count > 1 and self.file_name_needed = true

    file_lines = File.open(file).readlines.map(&:chomp)

    matched_lines = []
    unmatched_lines = []

    file_lines.each_with_index do |line, i|
      lines = line.match?(pattern) ? matched_lines : unmatched_lines

      text = if file_names_only
               lines.include?(file) and next or file
             else
               file_name_prefix + line_number_prefix(i + 1) + line
             end

      lines << text
    end

    lines = invert_match ? unmatched_lines : matched_lines
    lines.join("\n")
  end

end
