class Isogram
  def self.isogram?(input)
    new(input).isogram?
  end

  private

  attr_accessor :text_letters,
                :unique_letters

  def initialize(text)
    self.text_letters   = text.downcase.scan(/\w/)
    self.unique_letters = Set.new(text_letters).to_a
  end

  public

  attr_reader :text_letters,
              :unique_letters

  def isogram?
    text_letters == unique_letters
  end
end
