class Proverb

  LINE = "For want of a %<thing>s the %<next_thing>s was lost.\n"
  END_LINE = 'And all for the want of a %<qualifier>s%<thing>s.'

  private

  attr_accessor :things, :qualifier

  def initialize(*things, qualifier: nil)
    self.things = things

    self.qualifier = qualifier + ' ' if qualifier
  end

  public

  def to_s
    things.each_with_object(+'').with_index do |(thing, proverb), i|
      if i == things.length - 1
        proverb << END_LINE % { qualifier:, thing: things.first }
      else
        proverb << LINE % { thing:, next_thing: things[i + 1] }
      end
    end

  end

end
