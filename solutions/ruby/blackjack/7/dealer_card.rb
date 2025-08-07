require_relative 'blackjack'

# Dealers 1 card
class DealerCard
  def initialize(card)
    @card = card
  end

  def ten_or_higher?
    # Agree this was/still is redundant and would like to instead call parse
    # I've kept parse_card b/c the tests directly call `parse_card`
    # and I havent thought of a reasonably concise way around it
    Blackjack.parse_card(@card) >= 10
  end

  def less_than_seven?
    # Ditto - redundant
    Blackjack.parse_card(@card) < 7
  end
end
