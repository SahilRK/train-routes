require './lib/route.rb'
require './lib/town.rb'
require 'pry'
route = Route.new("AB5", "BC4", "CD8", "DC8", "DE6", "AD5", "CE2", "EB3", "AE7")

puts route.calc_distance_btw_towns("A","B","C")
puts route.calc_distance_btw_towns("A","D")
puts route.calc_distance_btw_towns("A","D","C")
puts route.calc_distance_btw_towns("A","E","B","C","D")
puts route.calc_distance_btw_towns("A","E","D")
