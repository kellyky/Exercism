class Blackjack
  def self.parse_card(card)
    case card
    when "ace" then 11
    when "two" then 2
    when "three" then 3
    when "four" then 4
    when "five" then 5
    when "six" then 6
    when "seven" then 7
    when "eight" then 8
    when "nine" then 9
    when "ten" then 10
    when "jack" then 10
    when "queen" then 10
    when "king" then 10
    when "joker" then 0
    end
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

