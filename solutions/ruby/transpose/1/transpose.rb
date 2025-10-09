class Transpose

  def self.transpose(characters)
    new(characters).transpose
  end

  private

  attr_writer :characters, :columns, :rows

  def initialize(characters)
    self.characters = characters
    self.rows = characters.split("\n")

    length = rows.empty? ? 0 : rows.max_by(&:length).length
    rows.map! do |entry|
      entry.ljust(length)
    end
    self.columns = rows.map { |row| row.split('') }
  end

  public

  attr_reader :characters, :columns, :rows

  def transpose
    columns.transpose.map(&:join).join("\n").strip
  end
end
