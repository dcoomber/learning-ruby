#!/usr/bin/env ruby

# Challenge: Blanket Patterns
puts 'Challenge: Blanket Patterns'

# colours:  RRGGBBYYKK
# 20 rows
# Shift to the left and append to end

colors = 'RRGGBBYYKK'
rows = 20

1.upto(rows) do |row|
  padding = row < 10 ? ' ' : ''
  puts "#{padding}#{row}  #{colors}"
  colors = colors[1..-1] + colors[0]
  # colors = colors.chars.rotate(row).join
end

colors = '++**~~^^##'
rows = 20

colors_array = colors.split('')

1.upto(rows) do |row|
  padding = row < 10 ? ' ' : ''
  puts "#{padding}#{row}  #{colors_array.join}"
  first = colors_array.shift
  colors_array << first
end
