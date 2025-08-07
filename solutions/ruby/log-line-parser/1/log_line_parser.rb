class LogLineParser
  def initialize(line)
    @line = line.split(' ')
  end

  def message
    "#{@line.slice(1..-1).join(' ')}"
  end

  def log_level
    @line.slice(0).downcase.gsub(/[^a-z]/, '')
  end

  def reformat
    "#{message} (#{log_level})"
  end
end
