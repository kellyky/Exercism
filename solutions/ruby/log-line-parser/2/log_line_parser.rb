class LogLineParser
  def initialize(line)
    @log_level, @message = line.split(':')
  end

  def message
    @message.strip
  end

  def log_level
    @log_level.downcase.gsub(/[^a-z]/, '')
  end

  def reformat
    "#{message} (#{log_level})"
  end
end
