#!/usr/bin/env ruby

# Notes
# * Spaceship operator <=>
# * sort / sort_by
# * sort_by! / sort! (replaces contents)
# * sort on a hash returns an array - an ordered set

value1 = 10
value2 = 20

result = value1 <=> value2

puts "result is #{result}"

array = [6, 2, 1, 5, 4, 3]

x = array.sort { |v1, v2| v1 <=> v2 }
puts x.to_s

fruits = ['apple', 'banana', 'orange', 'kiwi', 'pear']

x = fruits.sort { |v1, v2| v1.length <=> v2.length }
puts x.to_s

fruits = ['apple', 'banana', 'orange', 'kiwi', 'pear']

x = fruits.sort_by { |fruit| fruit.length }
puts x.to_s
