class Blackjack
  BLACKJACK = 21
  HIGH_RANGE = 17..20
  MID_RANGE = 12..16
  LOW_RANGE = 4..11


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
    end
  end

  def self.first_turn(card1, card2, dealer_card)
    player_hand = [card1, card2]
    score_current_hand = player_hand.sum { |card| parse_card(card) }

    case
    when two_aces?(player_hand)
      'P'
    when score_current_hand == 21 && !ten_or_higher?(dealer_card)
      'W'
    when HIGH_RANGE.include?(score_current_hand) || (score_current_hand == 21 && ten_or_higher?(dealer_card))
      'S'
    when MID_RANGE.include?(score_current_hand) && less_than_seven?(dealer_card)
      'S'
    else 
      'H'
    end
  end

  def self.two_aces?(cards)
    cards.all?('ace')
  end

  def self.ten_or_higher?(card)
    parse_card(card) >= 10
  end

  def self.less_than_seven?(card)
    parse_card(card) < 7
  end
end


