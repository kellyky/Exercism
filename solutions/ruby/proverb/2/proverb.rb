class Proverb

  LYRIC = "For want of a %<thing>s the %<next_thing>s was lost.\n"
  END_LYRIC = 'And all for the want of a %<qualifier>s%<thing>s.'

  private_constant :LYRIC, :END_LYRIC

  private

  attr_accessor :things, :qualifier

  def initialize(*things, qualifier: nil)
    self.things = things
    self.qualifier = qualifier + ' ' if qualifier
  end

  def last_item?(i)
    !things[i + 1]
  end

  def lyric(thing, i)
    if last_item?(i)
      END_LYRIC % { qualifier:, thing: things.first }
    else
      LYRIC % { thing:, next_thing: things[i + 1] }
    end
  end

  public

  def to_s
    things.each_with_object(+'').with_index do |(thing, proverb), i|
      proverb << lyric(thing, i)
    end
  end

end
