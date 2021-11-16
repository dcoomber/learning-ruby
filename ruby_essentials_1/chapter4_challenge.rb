#!/usr/bin/env ruby

# Notes
# puts :: line feed at the end
# print :: no line feed
# gets :: gets user input (until they hit RETURN)
#   will include the line feed
#   normally see chop (removes last character) or chomp (removes last character if its a line feed)

random_number_upper = 10
number_of_guesses = 3

# Show a game title
puts '----------------------'
puts '| Ruby Guessing Game |'
puts '----------------------'

# Get the players name and say hello
print "What is your name?\n> "
name = gets.chomp
puts "Hello, #{name}."

# Explain the rules
puts 'We are going to play a guessing game.'
puts "I will choose a random number between 1 and #{random_number_upper}"
puts "and you will have #{number_of_guesses} chances to guess it."

# Pick a random number
random_number = rand(random_number_upper) + 1
puts 'Okay, I have my number.'

# Get the player's guess, using a loop to allow them to guess 3 times
1.upto(number_of_guesses) do |guess_number|
  print "Guess #{guess_number}: "
  guess = gets.chomp.to_i

  # Tell the player if their guess is correct or not
  if guess == random_number
    puts "Great guessing, #{name}!"
    puts "My number was #{random_number}!"
    break
  else
    puts 'Sorry, that wasn\'t it.'

    if guess_number == number_of_guesses
      puts "\nThat was your last guess.\nMy number was #{random_number}."
    end
  end
end

puts "\n\nGoodbye!"
