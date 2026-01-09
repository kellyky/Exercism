module Lyrics

  VERSE = <<~verse
    %<food>s
    %<reason>s
    %<consequence>s
  verse

  SWALLOWED_A_WHAT = <<~critter
    I know an old lady who swallowed a %<critter>s.
  critter

  TO_CATCH_PREVIOUS = <<~to_catch_previous
    She swallowed the %<critter>s to catch the %<previous>s.
  to_catch_previous

  DEATH_BY_FLY = <<~consequence_fly
    I don't know why she swallowed the fly. Perhaps she'll die.

  consequence_fly

  DEATH_BY_HORSE = <<~consequence_horse
    She's dead, of course!
  consequence_horse

  CRITTER = {
    fly: DEATH_BY_FLY,
    spider: "It wriggled and jiggled and tickled inside her.\n",
    bird: "How absurd to swallow a bird!\n",
    cat: "Imagine that, to swallow a cat!\n",
    dog: "What a hog, to swallow a dog!\n",
    goat: "Just opened her throat and swallowed a goat!\n",
    cow: "I don't know how she swallowed a cow!\n",
    horse: DEATH_BY_HORSE
  }
end

Critter = Data.define(:name, :line)

class FoodChain
  include Lyrics

  @@to_catch_previous = +''

  CRITTERS = CRITTER.keys

  def self.song
    CRITTERS.map.with_index do |critter, i|
      previous = CRITTERS[i - 1]
      new(critter: critter, previous: previous).verse
    end.join
  end

  private

  attr_writer :critter,
              :previous

  attr_accessor :lyric, :line,
                :spider

  def initialize(critter:, previous:)
    current_critter = Critter.new(name: critter, line: CRITTER[critter])

    self.line = current_critter.line
    self.critter = current_critter.name

    self.previous = previous
    self.spider   = 'spider that wriggled and jiggled and tickled inside her'

    self.lyric  = +''
  end

  def bird?
    critter == :bird
  end

  def fly?
    critter == :fly
  end

  def horse?
    critter == :horse
  end

  def to_catch_previous
    self.previous = spider if bird?

    @@to_catch_previous.prepend(TO_CATCH_PREVIOUS % {critter:, previous:})
  end

  def there_was_an_old_lady_who_swallowed_a_what
    SWALLOWED_A_WHAT % {critter:}
  end

  def she_swallowed_this_critter_to_catch_that_critter
    to_catch_previous
    CRITTER[critter] +  @@to_catch_previous
  end

  def death_by_what
    critter == :horse ? DEATH_BY_HORSE : DEATH_BY_FLY
  end

  public

  attr_reader :critter,
              :previous

  attr_accessor :lyric

  def verse
    lyric << there_was_an_old_lady_who_swallowed_a_what

    unless fly? || horse?
      lyric << she_swallowed_this_critter_to_catch_that_critter
    end

    lyric << death_by_what
  end

end