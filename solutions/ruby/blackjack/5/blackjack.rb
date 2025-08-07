class Blackjack
  BLACKJACK = 21
  HIGH_RANGE = 17..20
  MID_RANGE = 12..16
  LOW_RANGE = 4..11

  # Assuming a valid deck
  CARD_VALUES = {
    "ace" => 11,
    "two" => 2,
    "three" => 3,
    "four" => 4,
    "five" => 5,
    "six" => 6,
    "seven" => 7,
    "eight" => 8,
    "nine" => 9,
    "ten" => 10,
    "jack" => 10,
    "queen" => 10,
    "king" => 10,
    "joker" => 0
  }

  def self.parse_card(card)
    CARD_VALUES[card]
  end

  def self.card_range(card1, card2)
    score = [card1, card2].sum { |card| parse_card(card) }
    case score
    when LOW_RANGE then 'low'
    when MID_RANGE then 'mid'
    when HIGH_RANGE then 'high'
    when BLACKJACK then 'blackjack'
    else 'error - invalid score'
    end
  end

  def self.first_turn(card1, card2, dealer_card)
    new(card1, card2, dealer_card).play
  end

  def initialize(card1, card2, dealer_card)
    @player_hand = PlayerHand.new(card1, card2)
    @dealer_card = DealerCard.new(dealer_card)
  end

  def play
    case
    when should_split? then 'P'
    when automatic_win? then 'W'
    when should_stand? then 'S'
    else 'H'
    end
  end

  def should_split?
    @player_hand.two_aces?
  end

  def automatic_win?
    @player_hand.blackjack? && !@dealer_card.ten_or_higher?
  end

  def should_stand?
    player_blackjack_and_dealer_high? || @player_hand.high_range_score? || player_mid_and_dealer_low?
  end

  def player_blackjack_and_dealer_high?
    @player_hand.blackjack? && @dealer_card.ten_or_higher?
  end

  def player_mid_and_dealer_low?
    @player_hand.mid_range_score? && @dealer_card.less_than_seven?
  end

  # First 2 cards in players hand
  class PlayerHand < Blackjack
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

    def high_range_score?
      Blackjack::HIGH_RANGE.include?(@score)
    end

    def mid_range_score?
      Blackjack::MID_RANGE.include?(@score)
    end
  end

  class DealerCard < Blackjack
    def initialize(dealer_card)
      @dealer_card = dealer_card
    end

    def ten_or_higher?
      Blackjack.parse_card(@dealer_card) >= 10
    end

    def less_than_seven?
      Blackjack.parse_card(@dealer_card) < 7
    end
  end
end
