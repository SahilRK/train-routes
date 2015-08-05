class Town
  def initialize(routes)
    @route_towns = routes
  end

  def create_towns_distance
    src_dest_town = []
    distance = []
    @route_towns.each do |town|
      src_dest_town << town[0]+town[1]
      distance << town[2]
    end
    return src_dest_town, distance
  end

  def valid_town(existing_towns, town_status)
    @route_towns.each {|town| town_status = existing_towns.include?(town)}
    return town_status
  end

end
