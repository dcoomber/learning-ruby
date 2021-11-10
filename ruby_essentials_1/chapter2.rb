# Objects
puts 'Objects'

=begin
* No primitives in Ruby, only objects
* Similar to physical objects
* Objects can represent abstract ideas
* Have attributes
* Instance of a class, differentiated by attributes
* Have behaviours
=end

# Variables
puts 'Variables'

=begin
* Variables are not objects, but act like an object once assigned
* References an object
* Convention:  lowercase_with_underscores
* Use plain English for variables names - better readablity
* Scope indicators
    $variable    Global variable
    @@variable   Class variable
    @variable    Instance variable
    variable     Local
    variable     Block
=end

x = 1

# Returns its value
puts x
puts x + 1

# Must do assignment first (e.g. uncomment next line and will fail)
# y

y = 10

puts y

# Numbers: Integers
puts 'Numbers: Integers'

=begin
* Integer
* Float
* Assignment shorthand (x += 2)
=end

y += 2

puts y

puts y.class
puts y.next

# Numbers: Floats
puts 'Numbers: Floats'

=begin
* Integer
* Float
* Both inherit from Numeric
* Float has a decimal (i.e. precision)
=end

x = 10
puts x.class

y = 10.0
puts y.class

puts '  converts integer to float when adding a float to an integer'
x += y
puts x.class

puts '  when dividing integers, Ruby assumes you don\'t care for the precision'
x = 10 / 3
puts x
puts x.class

puts '  works when making one or both a float'
x = 10 / 3.0
puts x
puts x.class

x = 10 / 3.to_f
puts x
puts x.class

# Strings
puts 'Strings'

=begin
* Concatenate strings using plus sign (+)
* Append operator (<<)
=end

puts 'I' + ' ' + 'love' + ' ' + 'Ruby'

x = 'Hello'
x += ' David'

y = 'This'
y << ' is cool'

puts x
puts y

puts 'Tada ' * 3

puts x.reverse

puts y.capitalize

puts y.upcase

puts x.reverse.capitalize

puts y.downcase

puts x.length

# Strings
puts 'String escaping and interpolation'

=begin
* Escaping characters (e.g. \' \")
* Control characters only work in double quotes
    \n  Newline
    \t  Tab
    \\  Backslash
    \a  Bell
    \b  Backspace
    \e  Escape
    \f  Form feed
    \r  Carriage return
    \s  Space
    \v  Vertical tab
* Interpolation
=end

# Interpolation
msg = 'I love Ruby'
puts "I just called to say #{msg}."

# Can also do Ruby processing
puts "1 + 1 = #{1 + 1}"

# Arrays
puts 'Arrays'

=begin
* 0 indexed
* Does not have to be homogeneous (same type)
=end

empty_array = []
puts empty_array.to_s

my_array = [1, 2, '3', 4.0, 5]
puts my_array.to_s

# Setting a value
my_array[1] = 'two'
puts my_array[1].to_s

# Lets you skip items and preserves the order of the array (notice empty item)
my_array[6] = 'six'
puts my_array.to_s
puts my_array[5].class

# First item in the array
puts my_array[0].to_s

# Last item in the array
puts my_array[-1].to_s

# Subarray
puts my_array[1, 3].to_s

# Last two items in the array
puts my_array[-2, 2].to_s

# Range from array
puts my_array[1..3].to_s
