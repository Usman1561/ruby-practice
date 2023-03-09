# File Handling
# Reading from a file
File.open('file.txt', 'r') do |file|
  puts file # meta data about our file
  puts file.read # reads all the data stored in file variable
end
puts '-----------------------------------------'

File.open('file.txt', 'r') do |file|
  puts file.readline # reads data from a single line by traversing on single line.
  puts file.readline # a second readline starts from second.
  puts file.readlines # read all the lines in a file but traverses from third.
end
puts '-----------------------------------------'

# using a loop
File.open('file.txt', 'r') do |file|
  file.readlines.each do |line|
    puts line
  end
end
puts '-----------------------------------------'

# the most simple way
file = File.open('file.txt', 'r')
puts file.read
file.close

# Writing to a file
file = File.open('file.txt', 'a+')
# file.write '--- we have manually added this line using mode write ---'
puts file.read
file.close

# an example of yeild method
def calculation(a, b)
  yield(a, b)
end
puts calculation(1, 3) { |a, b| a + b }

# implicit x explcit block
def method(array, block)
  p array.select(&block)
end
method([1, 3, 5, 6, 8], ->(num) { num.odd? })

# different ways to write blocks
addition = ->(a, b) { a + b }
puts addition.call(7, 9)

addition = lambda { |a, b|
  a + b
}
puts addition.call(5, 7)

addition = lambda do |a, b|
  a + b
end
puts addition.call(2, 2)

addition = ->(a, b) do; a + b; end
puts addition.call(3, 3)

# Inheritance
# Class Method Overriding
module Animal
  # animal class
  class Animal
    def move
      'I can move'
    end
  end

  # bird class
  class Bird < Animal
    def move
      super + ' by flying'
    end
  end

  # human class
  class Human < Animal
    def move
      super + ' by walking'
    end
  end

  # penguin class
  class Penguin < Bird
    def move
      'I can move by swimming'
    end
  end
  puts Animal.new.move
  puts Bird.new.move
  puts Human.new.move
  puts Penguin.new.move
end

# instance varialble and accessors
# use of getter/setter in classes
class Item
  def initialize(color = 'blue')
    @color = color
  end

  def description
    [@color]
  end

  def new_color(new_color)
    @color = new_color
    @color
  end
end
puts Item.new('skye blue').description
item = Item.new
item.new_color('navy blue')
puts item.description

# attribute reader, writer and accessor
class Person
  attr_accessor :name, :age
  attr_reader :category
  attr_writer :experience

  def initialize(name, age, experience, category)
    @name = name
    @age = age
    @experience = experience
    @category = category
  end

  def show
    puts "the name of employee is:#{@name},"
    puts "the age of employee is:#{@age},"
    puts "the expereience level is:#{@experience}."
    puts "the category he belongs to:#{@category}"
  end
end
person = Person.new('name', 'above 20', 'fresher', 'ASC')
person.show

person.name = 'usman' # using attr_accessor
person.age = '22'
person.show

person.experience = '3 months internship' # using attr_writer
person.show

puts person.category # using attr_reader

# Variables and their types
# xyz, _xyz is local variable
# Abc is a constant variable
# @instance is an instance variable
# @@class is a class variable
# $no is a global variable

# self & == operator in detail problem solution
class Food
  attr_reader :item_name, :qty

  def initialize(item_name, qty)
    @item_name = item_name
    @qty = qty
  end

  def to_s
    "Item (#{@item_name}, #{@qty})"
  end

  def ==(other)
    item_name == other.item_name &&
      qty == other.qty
  end
end
p Food.new('abcd', 1)  == Food.new('abcd', 1)
p Food.new('abcd', 2)  == Food.new('abcd', 1)

# ruby used hash of the object for comparison
class Item1
  attr_reader :item_name, :qty

  def initialize(item_name, qty)
    @item_name = item_name
    @qty = qty
  end

  def to_s
    "Item (#{@item_name}, #{@qty})"
  end

  def hash
    item_name.hash ^ qty.hash
  end

  def eql?(other)
    puts '#eql? invoked'
    @item_name == other.item_name && @qty == other.qty
  end
end
p Item1.new('abcd', 1).hash
items = [Item1.new('abcd', 1), Item1.new('abcd', 1), Item1.new('abcd', 1)]
p items.uniq

# Destructuring
# usman, nabeel = [1, 2]
# puts usman
# puts nabeel

# a method with destructuring
def zen
  [42, true]
end
x, y = zen
puts x
puts y

# from a multi-dimensional array
[[1, 2, 3, 4], [42, 43]].each do |element|
  a, b = element
  puts "#{a} #{b}"
end

# destructuring using splat operator
item, *items = %w[pan socks cap]
p item
p items

# destructuring a selective part using splat to a var
first, *middle, last = [42, 43, 44, 45, 46, 47]
p first
p middle
p last

# array to Hash
ary = [[4, 8], [15, 16], [23, 42]]
puts Hash[*ary.flatten]

# array methods
def few2last(array)
  array.slice(-2..-1).join('|')
end
p few2last([1, 2, 3, 4, 5])