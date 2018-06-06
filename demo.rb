require_relative 'traffic_light'

light = TrafficLight.new
light.change_to(:warning)
light.signal
puts "Next state is #{light.next_state}."