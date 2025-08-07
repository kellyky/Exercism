require 'pry-byebug'
class TwelveDays
  DAY = {
    1 => :first,      2 => :second,
    3 => :third,      4 => :fourth,
    5 => :fifth,      6 => :sixth,
    7 => :seventh,    8 => :eighth,
    9 => :ninth,     10 => :tenth,
    11 => :eleventh, 12 => :twelfth
  }

  GIFT = {
    1 => 'a Partridge in a Pear Tree',      2 => 'two Turtle Doves',
    3 => 'three French Hens',               4 => 'four Calling Birds',
    5 => 'five Gold Rings',                 6 => 'six Geese-a-Laying',
    7 => 'seven Swans-a-Swimming',          8 => 'eight Maids-a-Milking',
    9 => 'nine Ladies Dancing',            10 => 'ten Lords-a-Leaping',
    11 => 'eleven Pipers Piping',          12 => 'twelve Drummers Drumming'
  }

  def self.song
    new.song
  end

  def initialize
    @song = ''
  end

  def song(day_of_xmas = 1)
    @song += verse(day_of_xmas)
    return @song if day_of_xmas == 12

    song(day_of_xmas + 1)
  end

  private

  def verse(day_of_xmas)
    gifts = build_verse_gifts(day_of_xmas)
    newlines = day_of_xmas == 12 ? "\n" : "\n\n"
    "#{verse_intro(day_of_xmas) + gifts.join(', ')}." + newlines
  end

  def build_verse_gifts(day_of_xmas)
    day_of_xmas.downto(1).map { |day_counter| gift(day_of_xmas, day_counter) }
  end

  def gift(day_of_xmas, day_counter)
    raw_gift = day_gift(day_counter)
    format_gift(day_of_xmas, day_counter, raw_gift)
  end

  def format_gift(day_of_xmas, day_counter, gift)
    and_a_partidge?(day_of_xmas, day_counter) ? "and #{gift}" : gift
  end

  def and_a_partidge?(day_of_xmas, day_counter)
    day_counter == 1 && day_of_xmas != 1
  end

  def verse_intro(day)
    "On the #{DAY[day]} day of Christmas my true love gave to me: "
  end

  def day_gift(day)
    GIFT[day].to_s
  end
end
