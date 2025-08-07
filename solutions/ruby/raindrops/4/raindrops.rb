Drop = Data.define(:number) do

  def pling
    number % 3 == 0 and 'Pling'
  end

  def plang
    number % 5 == 0 and 'Plang'
  end

  def plong
    number % 7 == 0 and 'Plong'
  end

end

class Raindrops

  SOUNDS = '%s'

  def self.convert(number)
    new(number).raindrops
  end

  private

  attr_accessor :chord,
                :drop,
                :number

  def initialize(number)
    self.number = number
    self.drop   = Drop.new(number)
    self.chord  = ''
    transcribe_droplets
  end

  def strum
    SOUNDS % chord
  end

  def transcribe_droplets
    drop.pling and chord << drop.pling
    drop.plang and chord << drop.plang
    drop.plong and chord << drop.plong
  end

  public

  attr_writer :chord

  def raindrops
    self.chord = chord.empty? ? number : chord
    strum
  end

end
