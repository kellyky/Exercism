class Transpose

  def self.transpose(characters)
    new(characters).transpose
  end

  private

  attr_writer :characters, :columns, :rows

  def initialize(characters)
    self.characters = characters
    self.rows = characters.split("\n")

    format_rows

    binding.irb
    self.columns = rows.map do |row|
      row.split('')
    end
  end

  def length
    rows.empty? ? 0 : rows.max_by(&:length).length
  end

  def format_rows
    rows.map! { |entry|
      entry.ljust(length)
    }
  end

  public

  attr_reader :characters, :columns, :rows

  def transpose
    # columns.transpose.map(&:join).map(&:rstrip).join("\n")
    columns.transpose.map do |column|
      column.join

    end.join("\n").rstrip
  end
end
