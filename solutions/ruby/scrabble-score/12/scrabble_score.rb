class Scrabble
  attr_reader :score, :letters

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

  ENGLISH_TILES.default_proc = proc { 0 }

  # English still a default for now but other tile sets supported
  def initialize(letters)
    @letters = letters.upcase.chars.map(&:to_sym)
    # @tile_set = tile_set
    @tile_set = tile_set || Tile.build_set(tile_set)
    @score = tiles_score
  end

  private

  def tiles_score
    letters.sum(&@tile_set)
  end
end

class Tile
  def self.build_set(tile_set)
    binding.pry
    new(tile_set)
  end

  attr_reader :tile_set

  def initialize(tile_set)
    @tile_set = tile_set
  end
end

# Example input - custom user-provided tile set
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
  # puts Scrabble.new("he'e").to_i # 14   # not handled yet
end
