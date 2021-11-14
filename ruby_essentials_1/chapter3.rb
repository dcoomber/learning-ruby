# Control Structures
puts '# Control Structures'

=begin
* Determine circumstances at runtime
* Conditionals
* Loops
* Iterators
=end

# Conditionals
puts '# Conditionals'

=begin
* If else elsif
* Unless
* Case
=end

fruit = 'apple'

if fruit == 'apple'
  puts fruit.upcase
end

fruit = 'orange'

x = 10

if x <= 10
  puts '10 or below'
elsif x <= 20
  puts '20 or below'
else
  puts '20 or above'
end

# Unless
puts '# Unless'

=begin
* Opposite of if (e.g. if !TRUE)
* Sometimes aids in readability (e.g. when negative... .sold_out? as opposed to .visible?)
=end

cart = ['apple', 'orange', 'banana']

unless cart.empty?
  puts "The first item is: #{cart[0]}"
else
  puts "The cart is empty"
end

# Case
puts '# Case'

=begin
* If more than a couple of options, case is better than if / unless
=end

count = 5

# Much more versatile version of case statement
case
when count == 0
  puts 'Nobody'
when count == 1
  puts '1 person'
when (2..5).include?(count)
  puts 'Several people'
else
  puts 'Many people'
end

# Simpler case statement when comparing single variable and vale
case count
when 0
  puts 'Nobody'
when 1
  puts '1 person'
when 2..5
  puts 'Several people'
else
  puts 'Many people'
end

# Conditionals:  Shorthand
puts '# Conditionals:  Shorthand'

# For simple comparisons.  Not as readable.

# Ternary operator
puts fruit == 'apple' ? 'Its and apple' : 'Not an apple'

# Or operator
x = 10
y = nil

x = y || 'apple'

puts x

# Or-Equals
x ||= y

# Statement modifiers (unless)
x = y unless x

greeting_enabled = true
puts 'Hello' if greeting_enabled

# Loops
puts '# Loops'

=begin
* For
* While
* Until
* Break
* Next
* Redo
=end

i = 5
loop do
  break if i <= 0
  puts "Countdown: #{i}"
  i -= 1
end
puts 'Blastoff!'

i = 5
while i > 0
  puts "Countdown: #{i}"
  i -= 1
end
puts 'Blastoff!'

cart = ['apple', 'orange', 'banana']

until cart.empty?
  puts "The first item is: #{cart.shift}"
end

# Iterators
puts '# Iterators'

=begin
* Numbers
  * times
  * upto
  * downto
* Range
  * each
  * step
* String
  * each_line
  * each_char
  * each_byte
* Array
  * each
  * each_index
  * each_with_index
* Hash
  * each
  * each_key
  * each_value
  * each_pair
* block variables
=end

i = 5

i.times do
  puts "Countdown: #{i}"
  i -= 1
end

puts 'Blastoff!'

# Using a block variable
5.downto(1) do |f|
  puts "Countdown: #{f}"
end
puts 'Blastoff!'

fruits = ['apple', 'orange', 'banana']

fruits.each do |fruit|
  puts fruit.capitalize
end

for fruit in fruits
  puts fruit.upcase
end

5.downto(1) {|f| puts "Countdown: #{f}"}
puts 'Blastoff!'
