class Isogram
  def self.isogram?(input)
    phrase = input.downcase.scan(/\w+/).join
    return true if phrase.empty?
    letters = phrase.split("")
    letters.uniq.length == letters.length
  end
end
