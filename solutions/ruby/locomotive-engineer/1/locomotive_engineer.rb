class LocomotiveEngineer
  def self.generate_list_of_wagons(*wagon_ids)
    wagon_ids
  end

  def self.fix_list_of_wagons(each_wagons_id, missing_wagons)
    wagon_a, wagon_b, wagon_c, *other_wagons = each_wagons_id
    wagons = *wagon_c, *missing_wagons, *other_wagons, *wagon_a, *wagon_b
    wagons
  end

  def self.add_missing_stops(route, **stops)
    route[:stops] = stops.values
    route
  end

  def self.extend_route_information(route, more_route_information)
    route.merge!(more_route_information)
  end
end
