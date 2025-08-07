class Scrabble
  attr_accessor :word
  
  def initialize(word)
    @word = word.upcase
    @tiles = Hash.new
  end

  def score
    build_tiles
    @word.chars.sum { |letter| @tiles[letter] }
  end

  private
  
  def build_tiles
    tile_score(%w[A E I O U L N R S T], 1)
    tile_score(%w[D G], 2)
    tile_score(%w[B C M P], 3)
    tile_score(%w[F H V W Y], 4)
    tile_score(%w[K], 5)
    tile_score(%w[J X], 8)
    tile_score(%w[Q Z], 10)
  end

  def tile_score(letters, points)
    letters.each { |letter| @tiles[letter] = points }
  end
end

