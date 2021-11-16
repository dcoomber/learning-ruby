#!/usr/bin/env ruby

def welcome_message
  puts 'Hello world!'
end

welcome_message

# can be called again
welcome_message

# can be redefined again without error
def welcome_message
  puts 'Hello everyone!'
end

welcome_message

