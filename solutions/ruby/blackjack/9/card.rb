require_relative 'blackjack'

# Indivual Card
# Used once for dealer_card
# Used for each card in player's hand
class Card
  CARD = {
    'joker' => 0,
    'two'   => 2,
    'three' => 3,
    'four'  => 4,
    'five'  => 5,
    'six'   => 6,
    'seven' => 7,
    'eight' => 8,
    'nine'  => 9,
    'ten'   => 10,
    'jack'  => 10,
    'queen' => 10,
    'king'  => 10,
    'ace'   => 11
  }

  ACE = 'ace'

  def self.parse(card)
    new(card).value
  end

  attr_accessor :card, :value

  private

  def initialize(card)
    self.card = card
    self.value = CARD[card]
  end

  public

  def ten_or_higher?
    value >= 10
  end

  def less_than_ten?
    !ten_or_higher?
  end

  def less_than_seven?
    value < 7
  end
end
