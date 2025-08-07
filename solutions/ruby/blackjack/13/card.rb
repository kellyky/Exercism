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

  def self.value(card)
    CARD[card]
  end

  attr_accessor :face, :value

  private

  def initialize(face:, value:)
    self.face = face
    self.value = value
  end
end
