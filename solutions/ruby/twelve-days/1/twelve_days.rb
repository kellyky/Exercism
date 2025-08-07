class TwelveDays
  DAY = {
    1 => :first, 2 => :second,
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

  def song
    day_counter = 1

    while day_counter <= 12
      gifts = []

      day_counter.downto(1).each do |gifting_day|
        gifts << if and_a_partidge?(day_counter, gifting_day)
                   "and #{day_gift(gifting_day)}"
                 else
                   day_gift(gifting_day)
                 end
      end

      verse = "#{verse_starter(day_counter) + gifts.join(', ')}."
      newlines = day_counter == 12 ? "\n" : "\n\n"
      @song += verse + newlines

      day_counter += 1
    end

    @song
  end

  private

  def and_a_partidge?(day_counter, gifting_day)
    gifting_day == 1 && day_counter != 1
  end

  def verse_starter(day)
    "On the #{DAY[day]} day of Christmas my true love gave to me: "
  end

  def day_gift(day)
    "#{GIFT[day]}"
  end
end
