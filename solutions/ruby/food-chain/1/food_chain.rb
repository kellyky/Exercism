module Lyrics

  VERSE = <<~verse
    %<food>s
    %<reason>s
    %<consequence>s
  verse

  FOOD = <<~critter
    I know an old lady who swallowed a %<critter>s.
  critter

  THIS_TO_CATCH_THAT = <<~this_to_catch_that
    She swallowed the %<critter>s to catch the %<previous>s.
  this_to_catch_that

  DEATH_BY_FLY = <<~consequence_fly
    I don't know why she swallowed the fly. Perhaps she'll die.

  consequence_fly

  DEATH_BY_HORSE = <<~consequence_horse
    She's dead, of course!
  consequence_horse

end

class FoodChain
  include Lyrics

  @@this_to_catch_that = +''

  CRITTER = {
    fly: "I don't know this_to_catch_that she swallowed the fly. Perhaps she'll die.",
    spider: "It wriggled and jiggled and tickled inside her.\n",
    bird: "How absurd to swallow a bird!\n",
    cat: "Imagine that, to swallow a cat!\n",
    dog: "What a hog, to swallow a dog!\n",
    goat: "Just opened her throat and swallowed a goat!\n",
    cow: "I don't know how she swallowed a cow!\n",
    horse: "She's dead, of course!\n"
  }

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

  attr_accessor :current,
                :spider

  def initialize(critter:, previous: nil)
    self.critter = critter
    self.previous = previous
    self.spider = 'spider that wriggled and jiggled and tickled inside her'
    self.current = +''
  end

  def this_to_catch_that
    if critter == :bird
      self.previous = spider
    else
    end
    @@this_to_catch_that.prepend(THIS_TO_CATCH_THAT % {critter:, previous:})
  end

  public

  attr_reader :critter,
              :previous

  attr_accessor = :current

  def verse
    current << FOOD % {critter:}

    case critter
    when :fly
      current << DEATH_BY_FLY
    when :spider
      this_to_catch_that
      current << CRITTER[critter]
      current << @@this_to_catch_that
      current << DEATH_BY_FLY
    when :horse
      current << DEATH_BY_HORSE
    else
      this_to_catch_that
      current << CRITTER[critter]
      current << @@this_to_catch_that
      current << DEATH_BY_FLY
    end
  end

end

if $PROGRAM_NAME == __FILE__
  puts FoodChain.song

end
