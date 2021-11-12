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

# Array methods
puts 'Array methods'

=begin
* 
=end

array = [2, 4, ['a', 'b'], nil, 4, 'c']

puts array.length
puts array.size
# Sub-array is only one element of this array

puts array.reverse.to_s

# bang indicates a more powerful version
puts array.reverse! # permanently reverses array in place
puts array.to_s

puts array.shuffle.to_s

puts array.shuffle! # permanently reverses array in place

puts array.uniq.to_s

puts array.compact.to_s  # removes any nils

puts array.flatten.to_s  # flattens out sub-arrays

puts array.include?(2)   # note the question mark

puts array.delete_at(1)

puts array.delete('c')

puts [1, 2, 3, 4].join(',')   # returns a string from an array

puts "1,2,3,4".split(',').to_s     # creates an array from a string

puts array.push(5).to_s    # adds an item to the end of an array

puts array.pop.to_s        # removes an item from the end of an array

puts array.shift(1).to_s      # adds an item to the beginning of an array

puts array.unshift.to_s    # removes an item from the beginnng of an array

# Can add arrays together... or subtract
puts [1,2,3] + [3,4,5]

puts [1,2,3] - [2]

# Hashes
puts 'Hashes'

=begin
* Hash:  An unordered, object-indexed collection of objects (or key-value pairs)
* Object indexed, not integer indexed
* Hash keys must be unique
* Called dictionaries or associated arrays in other languages
* Uses curly braces (a bit like JSON notation?)
* Hash rocket =>
=end

car = {
    'brand' => 'Ford',
    'model' => 'Mustang',
    'year' => 1964,
    'color' => 'Blue',
    'interior_color' => 'Tan'
}

puts car.to_s

# Returning values - same notation for arrays
puts car['model']

# Add a new key-value pair
car['doors'] = 4

# Return an array of the keys
puts car.keys.to_s

puts car.values.to_s

puts car.length
puts car.size

# Symbols
puts 'Symbols'

=begin
* Like strings, but cannot be edited
* Begins with a colon
* Not delimited by quotes
* All lowercase, underscore, and no spaces
* A string that acts as a label
* Can be used as a hash key
* More efficient than strings (memory management)
* New hash symobol shorthand - looks a lot like JSON (keys in shorthand are always a symbol)
* Cannot use integers as keys with the shorthand
=end

person = {
    :name => 'David',
    :lastname => 'Smith'
}

puts person[:name].to_s

# New hash shorthand - looks a lot like JSON

scores = {low: 1, medium: 2, high: 3}

puts scores.to_s

# Booleans
puts 'Booleans'

=begin
* Comparison and logic operators
=end

x = 1
puts x == 1
puts x != 1
puts x > 0 && x < 100
puts x.positive?
puts x.between?(1, 100)

puts person.key?(:name)
person.has_value?('David')

# Ranges
puts 'Ranges'

=begin
* Inclusive range 1..10
* Exlusive range 1...10
* Most useful in loops and iterators
=end

inclusive = 1..10

puts inclusive.include?(5).to_s

# Explode out into array
array = [*inclusive]
puts array.to_s

# Constants
puts 'Constants'

=begin
* Constants are always in all caps
* Can change the value - Ruby will warn
* Even if just first letter is Caps, Ruby will warn
=end

# Nil
puts 'Nil'

=begin
* Nothing, Null
=end

product = nil
puts product.nil?
puts !product

# Challenge: Roman Numerals
puts 'Challenge: Roman Numerals'

number_map_array = [nil, 'I', 'II', 'III', 'IV', 'V', 'VI', 'VII', 'VIII', 'IX', 'X', 'XI', 'XII', 'XIII', 'XIV', 'XV', 'XVI', 'XVII', 'XVIII', 'XIX', 'XX']

puts number_map_array[4]

number_map_hash = {
    1 => 'I',
    2 => 'II',
    3 => 'III',
    4 => 'IV',
    5 => 'V',
    6 => 'VI',
    7 => 'VII',
    8 => 'VIII',
    9 => 'IX',
    10 => 'X'
}

puts number_map_hash[6]
