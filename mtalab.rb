require 'pry'

#clear the screen
system("clear")

N = ["TS", "34", "28", "23","US", "8"]
B = ["8","6","US","3"]
G = ["GC","33","28","23","US","AP"]

#change to array enables key:value search
network = {}
network[:N] = N
network[:B] = B
network[:G] = G

#Starting Point Inputs
puts "Welcome to New York's MTA. Choose your starting line from N,B,G..."
start_line = gets.chomp
start_list = network[start_line.to_sym]

puts "Now choose your station from #{start_list} ...."
start_station = gets.chomp

start_index = start_list.index(start_station)

#Finish Point Inputs
puts " All good journeys must come to an end so choose your finish line from N,B,G..."
finish_line = gets.chomp
finish_list = network[finish_line.to_sym]

puts "Now choose your final station from #{finish_list} ...."
finish_station = gets.chomp
finish_index = finish_list.index(finish_station)

if start_line != finish_line
#CALCULATE DISTANCE FOR EACH LEG IF STOPS are on DIFFERENT LINES
  first_leg = start_list.index("US") -start_index
  second_leg = finish_list.index("US") -finish_index
  total_distance = first_leg + second_leg.abs
  puts "Total stops: #{total_distance.abs}"
    if start_list.index("US") > start_index
      on = start_list[start_index..start_list.index("US")]
    else
      on = start_list[start_list.index("US")..start_index]
    end
    if finish_list.index("US") > finish_index
      off = finish_list[finish_index...finish_list.index("US")]
    else
      off = finish_list[finish_list.index("US")...finish_index]
    end
  puts "#{on} , change lines at U.S, #{off}:"
else
  total_distance = finish_index - start_index
  puts "Total stops: #{total_distance.abs}."
  puts " Thanks for travelling with MTA"
end