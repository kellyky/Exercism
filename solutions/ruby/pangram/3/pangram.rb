class Pangram
  def self.pangram?(string)
    string.downcase!
    alphabet = ('a'..'z').to_a
    alphabet.all? { |letter| string.include?(letter) }
  end
end
