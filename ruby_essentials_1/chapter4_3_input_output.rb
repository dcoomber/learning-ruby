#!/usr/bin/env ruby

# Notes
# puts :: line feed at the end
# print :: no line feed
# gets :: gets user input (until they hit RETURN)
#   will include the line feed
#   normally see chop (removes last character) or chomp (removes last character if its a line feed)

print 'What is your name? '
response = gets.chomp
puts "Hello, #{response}!"
 