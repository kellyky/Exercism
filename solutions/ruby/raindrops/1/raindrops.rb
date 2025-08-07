module Raindrops
  SOUNDS = {
    3 => 'Pling',
    5 => 'Plang',
    7 => 'Plong'
  }

  def self.convert(number)
    droplet_sounds = ''

    [3, 5, 7].each do |divisor|
      droplet_sounds += SOUNDS[divisor] if number.modulo(divisor).zero?
    end

    droplet_sounds.empty? ? number.to_s : droplet_sounds
  end
end
