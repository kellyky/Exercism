class Isogram
  def self.isogram?(input)
    letters = input.downcase.scan(/\w/)
    letters.uniq == letters
  end
end
