class Pangram
  ALPHABET = ("a".."z").to_a

  def self.pangram?(string)
    new(string).pangram
  end

  def initialize(string)
    @string = string.downcase
  end

  def pangram
    return false if @string.empty?
    ALPHABET.all?{ |letter| @string.include?(letter) }
  end
end

