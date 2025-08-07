require_relative 'blackjack'

# First 2 cards in players hand
class PlayerHand
  ACE = 'ace'

  def initialize(*cards)
    @cards = cards
    @score = score
  end

  def score
    @cards.sum { |card| Blackjack.parse_card(card) }
  end

  def blackjack?
    @score == Blackjack::BLACKJACK
  end

  def two_aces?
    @cards.all?(ACE)
  end

  def high_score?
    Blackjack::HIGH_RANGE.include?(@score)
  end

  def mid_score?
    Blackjack::MID_RANGE.include?(@score)
  end
end
