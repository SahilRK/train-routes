require './lib/route.rb'
require './lib/town.rb'
require 'pry'
route = Route.new("AB60", "BC10  ", "CD8", "DC8", "DE6", "AD5", "CE2", "EB3", "AE7")

puts "1) The distance of the route A-B-C : #{route.calc_distance_btw_towns("A","B","C")}"
puts "2) The distance of the route A-D : #{route.calc_distance_btw_towns("A","D")}"
puts "3) The distance of the route A-D-C : #{route.calc_distance_btw_towns("A","D","C")}"
puts "4) The distance of the route A-E-B-C-D : #{route.calc_distance_btw_towns("A","E","B","C","D")}"
puts "5) The distance of the route A-E-D : #{route.calc_distance_btw_towns("A","E","D")}"
puts "6) The number of trips starting at C and ending at C with a maximum of 3 stops : #{route.calc_max_trips_three_stops("C","C",3)}"
puts "8) The length of the shortest route from A to C : #{route.shortest_distance_src_dest("A","C")}"
puts "9) The length of the shortest route from B to B : #{route.shortest_dist_same_src_dest("B","B")}"
