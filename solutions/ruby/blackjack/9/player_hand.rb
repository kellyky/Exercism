require_relative 'card'
require_relative 'blackjack'

# First 2 cards in players hand
class PlayerHand
  ACE = Card::CARD[Card::ACE]

  private

  attr_accessor :score,
                :cards,
                :game,
                :ace

  def initialize(*cards, game: Blackjack, ace: ACE)
    self.cards = cards.map { |card| Card.parse(card) }
    self.score = score
    self.game = game
    self.ace = ace
  end

  def score
    cards.sum
  end

  public

  def blackjack?
    score == game::BLACKJACK
  end

  def two_aces?
    cards.all?(ace)
  end

  def high_score?
    game::HIGH_RANGE.include?(score)
  end

  def mid_score?
    game::MID_RANGE.include?(score)
  end
end
