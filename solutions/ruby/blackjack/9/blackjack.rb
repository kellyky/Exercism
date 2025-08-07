require_relative 'card'
require_relative 'dealer_card'
require_relative 'player_hand'

# Gameplay logic (to first turn)
class Blackjack
  BLACKJACK = 21
  HIGH_RANGE = 17..20
  MID_RANGE = 12..16
  LOW_RANGE = 4..11

  HIT = 'H'
  SPLIT = 'P'
  STAND = 'S'
  AUTOMATIC_WIN = 'W'

  def self.parse_card(card)
    Card.parse(card)
  end

  def self.card_range(card1, card2)
    score = [card1, card2].sum { |card| Card.parse(card) }
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
    @player = PlayerHand.new(card1, card2)
    @dealer = Card.new(dealer_card)
  end

  def play
    case
    when split? then SPLIT
    when automatic_win? then AUTOMATIC_WIN
    when stand? then STAND
    else HIT
    end
  end

  private

  def split?
    @player.two_aces?
  end

  def automatic_win?
    @player.blackjack? && @dealer.less_than_ten?
  end

  def stand?
    player_blackjack_dealer_high? ||
      @player.high_score? ||
      player_mid_dealer_low?
  end

  def player_blackjack_dealer_high?
    @player.blackjack? && @dealer.ten_or_higher?
  end

  def player_mid_dealer_low?
    @player.mid_score? && @dealer.less_than_seven?
  end
end
