class Route
  def initialize(*args)
    @routes = [*args]
    # @i = 0
  end

  def calc_distance_btw_towns(*args)
    towns = Town.new @routes
    src_dest,distance = towns.create_towns_distance
    distance = Route.distance_calculator(src_dest,distance,args,distance=[])
  end

  def self.distance_calculator(src_dest,dist,towns_to_be_cal,distance=[])
    begin
    routes_to_cal = towns_to_be_cal.length - 1
    i = 0
    routes_to_cal.times do
      index_val_of_towns_dist = src_dest.index(towns_to_be_cal[i]+towns_to_be_cal[i+1])
      distance << dist[index_val_of_towns_dist].to_i
      i += 1
    end
    return distance.reduce(:+)
    rescue
      "NO ROUTE"
    end
  end

end
