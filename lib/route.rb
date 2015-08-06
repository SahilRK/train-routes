class Route
  def initialize(*args)
    @routes = [*args]
    # @i = 0
  end

  def calc_distance_btw_towns(*args)
    src_dest,distance = source_destination_distance
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
      "NO SUCH ROUTE"
    end
  end

  def calc_max_trips_three_stops(src,dest,max_stops)
    start_with_c = []
    end_with_c = []
    src_dest,dist = source_destination_distance
    src_dest.each do |split_by_c|
      start_with_c << split_by_c if split_by_c[0] == src
      end_with_c << split_by_c if split_by_c[1] == dest
    end
    max_trips = check_routes(start_with_c,end_with_c,src_dest)
    return max_trips.length if max_trips.each{|max_stops| max_stops.count == 3 }
  end

  def check_routes(start_with_c,end_with_c,src_dest)
    i = 0
    route = []
    start_with_c = start_with_c.delete_if{|val| end_with_c.include?(val.reverse)}
    source = start_with_c[i][i+1]
    end_with_c.each do |end_of_route|
      if src_dest.include?(start_with_c[i]) && src_dest.include?(end_of_route)
        destination = end_of_route[i][i]
        connecting_station = source+destination
        if src_dest.include?(connecting_station)
          route << [start_with_c[i],connecting_station,end_of_route]
        elsif src_dest.include?(connecting_station.reverse)
          route << [start_with_c[i],connecting_station,end_of_route]
        end
      end
    end
    return route
  end

  def shortest_distance_src_dest(src,dest)
    shortest_distance = []
    src_dest,dist = source_destination_distance
    source = src
    destination = dest
    all_src_dest_routes = find_all_src_dest_routes(source,destination,src_dest,eliminate_elements=[])
    shortest_route = shortest_route(all_src_dest_routes,src,dest,dist,shortest_distance,src_dest)
  end

  def find_all_src_dest_routes(source,destination,src_dest,eliminate_elements)
    eliminate_elements << src_dest
    eliminate_elements.flatten.delete_if{|route| route[0] != source && route[1] != destination}
  end

  def shortest_route(all_src_dest_routes,src,dest,dist,shortest_distance,src_dest)
    routes = all_src_dest_routes
    routes.each do |current_town|
      if current_town[0] == src
        destination = current_town[1]
        dest_town = routes.select{|x| x.start_with?(destination) && x.end_with?(dest)}
        begin
          calc_distance = dist[src_dest.index(current_town)].to_i + dist[src_dest.index(dest_town.first)].to_i
        rescue
          calc_distance = "INVALID"
        end
          shortest_distance << calc_distance
      end
    end
    return shortest_distance.delete_if{|x| x.kind_of? String}.min
  end

  def shortest_dist_same_src_dest(src,dest)
    same_source = []
    same_dest = []
    src_dest,dist = source_destination_distance
    src_dest.each do |splitter|
      same_source << splitter if splitter[0] == src
      same_dest << splitter if splitter[1] == dest
    end
    max_trips = check_routes(same_source,same_dest,src_dest)
    max_trips = index_values_of_sources(src_dest,dist,max_trips)
  end

  def index_values_of_sources(src_dest,dist,sources)
    shortest_distance = []
    sources.flatten.each do |x|
      shortest_distance << dist[src_dest.index(x)].to_i
    end
    return shortest_distance.reduce(:+)
  end

  def source_destination_distance
    towns = Town.new @routes
    src_dest,dist = towns.create_towns_distance
  end

end
