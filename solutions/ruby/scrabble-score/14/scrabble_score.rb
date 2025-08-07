class Scrabble
  attr_reader :score, :letters

  def initialize(letters, tiles = nil)
    @letters = letters.upcase.chars.map(&:to_sym)
    @tile_set = Tile.create_set(tiles)
    @score = tiles_score
  end

  private

  def tiles_score
    letters.sum(&@tile_set)
  end
end

class Tile
  ENGLISH_TILES = {
    A: 1, N: 1,
    B: 3, O: 1,
    C: 3, P: 3,
    D: 2, Q: 10,
    E: 1, R: 1,
    F: 4, S: 1,
    G: 2, T: 1,
    H: 4, U: 1,
    I: 1, V: 4,
    J: 8, W: 4,
    K: 5, X: 8,
    L: 1, Y: 4,
    M: 3, Z: 10,
    '': 0
  }

  def self.create_set(tiles=nil)
    tiles = ENGLISH_TILES if tiles.nil?
    tiles.each { |letter, points| new(letter, points).assemble }
  end

  def initialize(letter, points)
    @letter = letter
    @points = points
    @set = { '': 0 }
  end

  def assemble
    @set.merge!({ @letter => @points })
    @set.default_proc = proc { 0 }
  end
end

# Mock user
if $PROGRAM_NAME == __FILE__
  Hawaiian_Tiles = {
    A: 1, N: 3,
    O: 2,
    P: 8,
    E: 4,
    H: 6, U: 5,
    I: 3,
    W: 9,
    K: 2,
    L: 7,
    M: 8,
    "'": 0
  }

  puts Scrabble.new("Humuhumunukunukuapua'a", Hawaiian_Tiles).score # 94
  puts Scrabble.new('hello').score # 8

  # puts Scrabble.new("he'e").to_i # 14
  # ^ I don't quite follow your goal here with calling .to_i instead of .score

  puts Scrabble.new("he'e", Hawaiian_Tiles).score # 14
end
