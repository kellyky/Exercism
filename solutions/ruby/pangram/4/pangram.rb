class Pangram
  def self.pangram?(string)
    alphabet = ('a'..'z').to_a
    alphabet.all? do |letter|
      string.downcase.include?(letter)
    end
  end
end
