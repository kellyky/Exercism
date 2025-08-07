module Raindrops

  def self.convert(number)
    sounds = {
      3 => 'Pling',
      5 => 'Plang',
      7 => 'Plong',
    }

    droplet_sounds = sounds.select { |divisor, _| (number % divisor).zero? }
    droplet_sounds.empty? ? number.to_s : droplet_sounds.values.join
  end

end
