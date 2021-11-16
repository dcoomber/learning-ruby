#!/usr/bin/env ruby

# Notes
# * inject / reduce
# * accumulator value as block variable - call it memo

(1..5).map { |i| i }

(1..5).inject { |memo, i| memo + i }
# memo is set to the return value of the block
