class Scrabble
  TILE_POINTS = {
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

  TILE_POINTS.default_proc = proc { 0 }

  attr_reader :score, :tiles

  def initialize(letters)
    @tiles = letters.upcase.chars.map(&:to_sym)
    @score = tiles_score
  end

  private

  def tiles_score
    tiles.sum(&TILE_POINTS)
  end
end
