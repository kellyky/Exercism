class Scrabble
  def initialize(word)
    @word = word
    @points_per_letter = letter_points
  end

  def score
    @word.chars.map { |letter| @points_per_letter[letter.downcase] }.sum
  end

  private
  
  def letter_points
    hash = Hash.new
    add_letter_scores(['a', 'e', 'i', 'o', 'u', 'l', 'n', 'r', 's', 't'], 1, hash)
    add_letter_scores(['d', 'g'], 2, hash)
    add_letter_scores(['b', 'c', 'm', 'p'], 3, hash)
    add_letter_scores(['f', 'h', 'v', 'w', 'y'], 4, hash)
    add_letter_scores(['k'], 5, hash)
    add_letter_scores(['j', 'x'], 8, hash)
    add_letter_scores(['q', 'z'], 10, hash)
    hash
  end

  def add_letter_scores(letters, points, hash)
    letters.each { |letter| hash[letter] = points }
  end
end
