#!/usr/bin/env ruby

# Notes
# Automatically after last line of code completes
# exit, exit!
# abort( msg )
# externally with interrupt signal:  CTRL + C

fruits = ['apple', 'banana', 'orange']

fruits.each do |fruit|
  puts fruit.capitalize
  if fruit == 'banana'
    # break
    # exit
    # exit!
    abort ('Stopping program')
    # redo
  end
end

puts "Total fruits: #{fruits.count}"
