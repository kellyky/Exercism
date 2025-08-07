class Blackjack
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
    when 4..11 then 'low'
    when 12..16 then 'mid'
    when 17..20 then 'high'
    when 21 then 'blackjack'
    end
  end

  def self.first_turn(card1, card2, dealer_card)
    return 'P' if [card1, card2].all?('ace')

    score_current_hand = [card1, card2].sum { |card| parse_card(card) }

    case score_current_hand
    when 21
      self.ten_or_higher?(dealer_card) ? 'S' : 'W'
    when 17..20
      'S'
    when 12..16
      parse_card(dealer_card) < 7 ? 'S' : 'H'
    when 0..11
      'H'
    end
  end

  def self.two_aces?(*cards)
    cards.count { |card| parse_card(card) }
  end

  def self.ten_or_higher?(card)
    parse_card(card) >= 10
  end
end

