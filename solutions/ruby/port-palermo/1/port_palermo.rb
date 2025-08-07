module Port
  IDENTIFIER = :PALE

  def self.get_identifier(city)
    city.slice(0, 4).upcase.to_sym
  end

  def self.get_terminal(ship_identifier)
    fuel = ship_identifier.slice(0, 3).to_s

    return :A if fuel == 'OIL' || fuel == 'GAS'

    :B
  end
end
