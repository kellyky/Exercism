class LogLineParser
  attr_reader :log_level, :message

  def initialize(line)
    @log_entry = line.split(':')
    @message = @log_entry[1].strip
    @log_level = @log_entry[0].downcase.delete('[]')
  end

  def reformat
    "#{message} (#{log_level})"
  end
end
