# Objects
puts "Objects"
=begin
* No primitives in Ruby, only objects
* Similar to physical objects
* Objects can represent abstract ideas
* Have attributes
* Instance of a class, differentiated by attributes
* Have behaviours
=end

# Variables
puts "Variables"

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
#y

y = 10

puts y

# Numbers: Integers
puts "Numbers: Integers"

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

=begin
* Integer
* Float
* Both inherit from Numeric
* Float has a decimal (i.e. precision)
* 
=end

puts 13.class
puts 13.0.class
