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
    Card.value(card)
  end

  def self.card_range(card1, card2)
    score = [card1, card2].sum { |card| Card.value(card) }
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

  private

  attr_writer :player, :dealer

  def initialize(card1, card2, dealer_card)
    self.player = PlayerHand.new(card1, card2)
    self.dealer = Card.new(dealer_card)
  end

  def player_blackjack_dealer_high?
    player.blackjack? && dealer_ten_or_higher?
  end

  def player_mid_dealer_low?
    player.mid_score? && dealer_less_than_seven?
  end

  def dealer_ten_or_higher?
    dealer.value >= 10
  end

  def dealer_less_than_ten?
    !dealer_ten_or_higher?
  end

  def dealer_less_than_seven?
    dealer.value < 7
  end

  def split
    SPLIT if split?
  end

  def split?
    player.two_aces?
  end

  def automatic_win
    AUTOMATIC_WIN if automatic_win?
  end

  def automatic_win?
    player.blackjack? && dealer_less_than_ten?
  end

  def stand
    STAND if stand?
  end

  def stand?
    player_blackjack_dealer_high? || player.high_score? || player_mid_dealer_low?
  end

  def hit
    HIT if hit?
  end

  def hit?
    !(split? || stand? || automatic_win?)
  end

  public

  attr_reader :player, :dealer

  def play
    split or automatic_win or stand or hit
  end
end
