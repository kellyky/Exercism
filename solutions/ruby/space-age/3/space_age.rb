class SpaceAge

  SECONDS_PER_EARTH_YEAR = 365.25 * 24 * 60 * 60

  ORBIT_IN_EARTH_YEARS = {
    mercury:   0.2408467,
    venus:     0.61519726,
    earth:     1.0,
    mars:      1.8808158,
    jupiter:  11.862615,
    saturn:   29.447498,
    uranus:   84.016846,
    neptune: 164.79132
  }

  ORBIT_IN_EARTH_YEARS.each do |planet, years|
    on_planet = ('on_%<planet>s' % {planet:}).to_sym

    define_method(on_planet) { earth_years / ORBIT_IN_EARTH_YEARS[planet]}
  end

  attr_reader :earth_years

  private

  attr_writer :seconds, :earth_years

  def initialize(seconds)
    self.seconds = seconds.to_r
    self.earth_years = seconds / SECONDS_PER_EARTH_YEAR
  end
end
