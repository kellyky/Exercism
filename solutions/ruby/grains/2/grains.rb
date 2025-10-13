module ChessBoard

  extend self

  SQUARES = 64

  class InvalidChessSquare < ArgumentError

    def initialize(message = 'Chess square must be between 1 and 64 (inclusive)')
      super
    end

  end

  def validate(number)
    raise InvalidChessSquare unless exist?(number)
  end

  def exist?(number)
    (1..SQUARES).include?(number)
  end

end

class Grains

  include ChessBoard

  BASE = 2

  private_constant :BASE

  def self.square(number = SQUARES)
    ChessBoard.validate(number)
    new(number).square
  end

  def self.total(number = SQUARES)
    ChessBoard.validate(number)
    new(number).total
  end

  private

  attr_writer :number, :squares

  def initialize(number)
    # Number of squares to fill
    self.number = number

    # Quantity of grains on each square
    self.squares = (0...number).map do |power|
      BASE**power
    end
  end

  public

  attr_reader :number, :squares

  # Number of grains on the given square
  def square
    squares.pop
  end

  # Total number of grains on the board
  def total
    squares.sum
  end

end
