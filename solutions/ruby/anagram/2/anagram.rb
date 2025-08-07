class Anagram

  private

  attr_reader :target_word

  def initialize(target_word)
    @target_word = target_word.downcase
  end

  def same_letters?(word)
    word.downcase.chars.sort == target_word.chars.sort
  end

  def non_indentical?(word)
    word.downcase != target_word
  end

  public

  def match(candidates)
    candidates.select do |candidate|
      non_indentical?(candidate) and same_letters?(candidate)
    end
  end

end
