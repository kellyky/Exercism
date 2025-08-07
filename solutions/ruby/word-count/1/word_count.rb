class Phrase
  def initialize(phrase)
    @phrase = phrase.downcase
    @word_count = {}
  end

  def word_count
    word_break =  /[.,\r\t\n ]+/
    @phrase.strip.split(word_break).each do |word|
      word.gsub!(/^\W|\W+$/, '')
      next if word.empty?

      @word_count[word] = 0 if @word_count[word].nil?
      @word_count[word] += 1
    end

    @word_count
  end
end
