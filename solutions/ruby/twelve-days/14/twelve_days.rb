class TwelveDays
  def self.song
    new.compose
  end

  def initialize
    @song = ''
  end

  def compose
    (1..12).each { |day_of_xmas| @song += Verse.new(day_of_xmas).compose }

    @song
  end
end

class Verse
  DAY = {
    1 => :first,      2 => :second,
    3 => :third,      4 => :fourth,
    5 => :fifth,      6 => :sixth,
    7 => :seventh,    8 => :eighth,
    9 => :ninth,     10 => :tenth,
    11 => :eleventh, 12 => :twelfth
  }

  def initialize(day_of_xmas)
    @day_of_xmas = day_of_xmas
  end

  def compose
    gifts = build_verse_gifts
    newlines = @day_of_xmas == 12 ? "\n" : "\n\n"
    "#{verse_intro + gifts.join(', ')}." + newlines
  end

  private

  def build_verse_gifts
    @day_of_xmas.downto(1).map do |day_counter|
      Gift.new(day_counter, @day_of_xmas).format_gift
    end
  end

  def verse_intro
    "On the #{DAY[@day_of_xmas]} day of Christmas my true love gave to me: "
  end
end

class Gift
  GIFT = {
    1 => 'a Partridge in a Pear Tree',      2 => 'two Turtle Doves',
    3 => 'three French Hens',               4 => 'four Calling Birds',
    5 => 'five Gold Rings',                 6 => 'six Geese-a-Laying',
    7 => 'seven Swans-a-Swimming',          8 => 'eight Maids-a-Milking',
    9 => 'nine Ladies Dancing',            10 => 'ten Lords-a-Leaping',
    11 => 'eleven Pipers Piping',          12 => 'twelve Drummers Drumming'
  }

  def initialize(day, day_of_xmas)
    @day = day
    @day_of_xmas = day_of_xmas
    @gift = day_gift
  end

  def format_gift
    if and_a_partridge?
      "and #{@gift}"
    else
      @gift
    end
  end

  private

  def and_a_partridge?
    @day == 1 && @day_of_xmas != 1
  end

  def day_gift
    GIFT[@day].to_s
  end
end
