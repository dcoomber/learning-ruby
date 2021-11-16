#!/usr/bin/env ruby

# Notes
# * Only used for hashes - merging two hashes together
# * merge! is destructive

h1 = { a: 100, b: 200, c: 300 }
h2 = { a: 300, b: 400, d: 500 }

puts h1.merge(h2).to_s

# key conflicts - keep the old value
h1.merge(h2) { |key, old, new| old }

# key conflicts - keep the new value
h1.merge(h2) { |key, old, new| new }
