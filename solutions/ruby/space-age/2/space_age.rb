class SpaceAge

  EARTH_YEARS = {
    mercury:   0.2408467,
    venus:     0.61519726,
    earth:     1.0,
    mars:      1.8808158,
    jupiter:  11.862615,
    saturn:   29.447498,
    uranus:   84.016846,
    neptune: 164.79132
  }

  SECONDS_PER_EARTH_YEAR = 365.25 * 24 * 60 * 60

  private

  attr_writer :seconds, :earth_years

  def initialize(seconds)
    self.seconds     = seconds.to_r
    self.earth_years = on_earth     # earth years as proxy
    binding.irb
  end

  public

  attr_reader :seconds, :earth_years

  def on_earth
    seconds / SECONDS_PER_EARTH_YEAR
  end

  def on_mercury
    earth_years / EARTH_YEARS[:mercury]
  end

  def on_venus
    earth_years / EARTH_YEARS[:venus]
  end

  def on_mars
    earth_years / EARTH_YEARS[:mars]
  end

  def on_jupiter
    earth_years / EARTH_YEARS[:jupiter]
  end

  def on_saturn
    earth_years / EARTH_YEARS[:saturn]
  end

  def on_uranus
    earth_years / EARTH_YEARS[:uranus]
  end

  def on_neptune
    earth_years / EARTH_YEARS[:neptune]
  end
end
