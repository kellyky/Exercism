require_relative 'blackjack'
require_relative 'card'

# First 2 cards in players hand
class PlayerHand
  ACE = Card::ACE

  private

  attr_accessor :score,
                :cards,
                :game,
                :ace

  def initialize(*cards, game: Blackjack, ace: ACE)
    self.cards = cards.map { |card| Card.new(face: card, value: Card.value(card)) }
    self.score = score
    self.game = game
    self.ace = ace
  end

  def score
    cards.sum(&:value)
  end

  public

  def blackjack?
    score == game::BLACKJACK
  end

  def two_aces?
    cards.all? { |card| card.face == Card::ACE }
  end

  def high_score?
    game::HIGH_RANGE.include?(score)
  end

  def mid_score?
    game::MID_RANGE.include?(score)
  end
end
