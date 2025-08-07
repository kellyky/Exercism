Letter = Struct.new(:letter) do
  def tile_letter
    letter.upcase.to_sym
  end
end

class Scrabble
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

  private

  attr_accessor :letters, :tile_set

  def initialize(letters, tile_set = ENGLISH_TILES)
    self.letters = letters.chars.map { |letter| Letter.new(letter).tile_letter }
    self.tile_set = build_tile_set(tile_set)
    self.score = tiles_score
  end

  def build_tile_set(tile_set)
    tile_set.each_with_object({}) do |(letter, points), set|
      set[letter] = points
    end
  end

  public

  attr_accessor :score

  def tiles_score
    letters.sum(&tile_set)
  end
end

# Mock user
if $PROGRAM_NAME == __FILE__
  HAWAIIAN_TILES = {
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

  puts Scrabble.new("Humuhumunukunukuapua'a", HAWAIIAN_TILES).score # 94
  puts Scrabble.new('hello').score # 8
  puts Scrabble.new("he'e", HAWAIIAN_TILES).score # 14
end
