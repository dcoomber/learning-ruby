#!/usr/bin/env ruby

# Notes
# * Ruby blanks - fill in the blank game (aka Mad Libs)
# * Think of a sentence or two and make sure that they have blanks in the sentence
#   "I decided to ________ a ________ party for my ________ ________"
# * Blanks = ['verb', 'noun', 'adjective', 'noun']
# * ask the user to provide each type of word
#   "Give me a _____: "

puts '-' * 15
puts '| Ruby Blanks |'
puts '-' * 15

blanks = ['verb', 'adjective', 'adjective', 'noun']

vowels = ['a', 'e', 'i', 'o', 'u']

answers = blanks.map do |request|
  article = vowels.include?(request[0]) ? 'an' : 'a'
  print "Give me #{article} #{request}: "
  gets.chomp
end

text = "I decided to #{answers[0]} a #{answers[1]} party for my #{answers[2]} #{answers[3]}."

puts text
