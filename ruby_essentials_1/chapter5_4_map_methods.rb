#!/usr/bin/env ruby

# Notes
# * map / collect
# * iterate through an enumerable
# * execute a code block on each item
# * add the result of the code block to a new array
# * number of items in equals the number of items out
# * map always returns an array - even if input was a hash
# * map! / collect! - mutates the original array

fruits = ['apple', 'banana', 'orange']

new_fruits = fruits.map do |fruit|
  fruit.upcase
end

puts new_fruits.to_s

fruits.map! do |fruit|
  fruit.capitalize
end

puts fruits.to_s
