class Phrase
  WORD_MATCH = /\b[\w']+\b/

  def initialize(phrase)
    @phrase = phrase.downcase
  end

  def word_count
    @phrase.scan(WORD_MATCH).each_with_object(Hash.new(0)) do |word, count|
      count[word] += 1
    end
  end
end