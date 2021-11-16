#!/usr/bin/env ruby

# Notes
# * do..end - multi-line blocks, performs actions, makes changes
# * { } - single line blocks, returns data without making changes
# * Block variables (|i| after do or inside curly brace)
# * Variable scope
#    Global    $variable
#    Class     @@variable
#    Instance  @variable
#    Local     variable
#    Block     variable
# * Block variable scope ends at end of block
# * Common usage
#    find, map, inject, sort
# * Many Ruby methods will accept a code block; usually modifies default behaviour
# * Can write custom methods that accept code blocks

i = 1
factor = 2

[1, 2, 3, 4, 5].each do |i|
  puts "#{i} * #{factor} = #{i * factor}"
end

puts i
