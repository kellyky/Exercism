class Scrabble
  def initialize(word)
    @word = word
    @points_per_letter = Hash.new
  end

  def score
    build_letter_point_map
    @word.chars.sum { |letter| @points_per_letter[letter.downcase] }
  end

  private
  
  def build_letter_point_map
    add_letter_scores(['a', 'e', 'i', 'o', 'u', 'l', 'n', 'r', 's', 't'], 1)
    add_letter_scores(['d', 'g'], 2)
    add_letter_scores(['b', 'c', 'm', 'p'], 3)
    add_letter_scores(['f', 'h', 'v', 'w', 'y'], 4)
    add_letter_scores(['k'], 5)
    add_letter_scores(['j', 'x'], 8)
    add_letter_scores(['q', 'z'], 10)
  end

  def add_letter_scores(letters, points)
    letters.each { |letter| @points_per_letter[letter] = points }
  end
end
