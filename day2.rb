# the work done is continuation of previous ruby concepts

# -- Instance vs Class Methods --
class Employee
  def self.sqrt(num)
    print "the square root of #{num} is:"
    puts Integer.sqrt(num)
  end

  def instance_method(num)
    num = num.next.next
    puts "this is an instance method of class that results in #{num}"
  end
end

# to call class method we can simply invoke it using class Employee
Employee.sqrt(16)

# instance method however is invoked only when instance of a class is stored in another variable
employee = Employee.new
employee.instance_method(4)
# or you can invoke instance method on class directly using new
Employee.new.instance_method(2)
# this is considered a bad practice as everytime you call new it invokes a new instance thus
# storing instance of a method in a var is much preferrable

# -- Spaceship Operator <=> --

# -- Arrays --
arr2 = [1, 2, 3, 4]
p arr2

puts arr2[-1] # negative index starts with -1 and goes on until the first element of array is reached

num = 22
p arr2 << 'string' << "age:#{num}" # interpolation and appending in arrays using <<
p arr2.push('name: usman')

# Transforming array

arr = [1, 2, 3, 4, 5]
trans_arr = arr.map { |i| i + 2 }
puts "the array #{arr} transformed into #{trans_arr} after an increment of value 2 on each"

names = %w[usman nabeel usama]
names_sel = names.select { |array| array.include?('usman') }
p names_sel

# remove specific something from array

names.delete_if { |array| array.length > 5 }
p names

arr.delete_if { |i| i.even? } # delete even no
p arr
arr = [1, 2, 3, 4, 5]
arr.delete_if { |i| i.odd? } # delete odd no
p arr

arr = [1, 2, 3, 4, 5]
arr.delete_if(&:odd?) # delete odd no with generalized preffered way
p arr

# arrays & hashes
# for loop in arr similar for hash
arr = [1, 3, 5]
for i in arr
  puts i
end

# problem in Ruby Primer
def array_copy(source)
  destination = []
  for i in source
    destination << i if i < 4
  end
  puts "the number added are #{destination}"
end
arr = [1, 3, 4, 5, 6]
array_copy(arr)

# each lop in ruby, a de facto standard over for loop
stu_ages = { 'usman' => 22, 'nabeel' => 23 }
stu_ages.each do |name, age|
  puts "Student name:#{name} and his age is:#{age}"
end

# solution for Ruby Primer problem in each loop
num = [1, 2, 4, 5]
def array_add(num)
  var = []
  num.each do |i|
    var << i if i < 4
  end
  puts "the number incremented less than 4 are #{var}"
end
array_add(num)

# hash, in & out
restaurant_menu = { 'Ramen' => 3, 'Dal Makhani' => 4, 'Coffee' => 2 }
restaurant_menu.each do |item, price|
  restaurant_menu[item] = price + (price * 0.1)
end
puts restaurant_menu

# array to hash

def artax
  a = [:punch, 0]
  b = [:temperature, 72]
  c = [:stops_bullets_with_hands, false]
  key_value_pairs = [a, b, c]
  hash = Hash[key_value_pairs]
end
p artax

# def arr_to_hash
#    a = ['name', 'usman', 'age', 22]
#    pairs = [ a ]
#    Hash[pairs]
# end
# p arr_to_hash

# Classes in Ruby
puts 'usman'.class
puts 'usman'.is_a?(String)

# a class with instance class variable and a constructor
class Rectangle
  def initialize(length, breadth)
    @length = length
    @breadth = breadth
  end

  def perimeter
    puts "perimeter is #{2 * (@length + @breadth)}"
  end

  def area
    puts "area of rectangle is #{@length * @breadth}"
  end
end

init = Rectangle.new(2, 3)
init.perimeter
init.area

# Methods in Ruby
puts 1.next
puts 1.method('next')
normal_invoke = 1.method('next')
p normal_invoke.call

# a method to reverse sign on different integers
def rev_sign(int)
  0 - int
end
puts rev_sign(100)
puts rev_sign(-5)

# a method where return is called early
def demo
  puts 'this piece of code will run'
  return
  puts 'this piece of code wont be executed because'
end
# accessing demo via class so to return a nilclass as its not visible
puts demo.class

# parameters with default value so even if no values assigned code wont through an error

def method_def(name = 'Employee', age = 'above 22', salary = 50_000)
  puts "the name of the Employee is #{name} with age #{age} and salary per month #{salary}"
end
method_def('usman', 22)

# arraying no of parameters with use of * (splat operator)

def method(*names)
  names.each do |name|
    puts "The name of employee is #{name}"
  end
end
method('usman', 'nabeel', 'usama')

# similarly we can use this to make a calculator
# lets make use of this and make an addition calculator
def add(*numbers)
  numbers.inject(0) { |sum, number| sum + number }
end
puts add(1)
puts add(1, 2)
puts add(1, 2, 3)
puts add(1, 2, 3, 4)

# we can also splat no of arrays to a single parameter using *
def add(num, num1, num2)
  num_add = num + num1 + num2
  puts num_add
end
arr = [1, 2, 3]
add(*arr)

# you can also mix splat parameters and lists
def add(*num)
  num.inject(0) { |sum, number| sum + number }
end

def add_message(string, *num)
  "#{string}: #{add(*num)}"
end
puts add_message('The sum of num is', 1, 2, 3)

# solution to problem
def introduction(age, gender, *names)
  puts "Meet #{names.join(' ')}, who are #{age} and #{gender}"
end
introduction(22, 'male', 'usman', 'nabeel', 'usama')

# lambda & blocks

Increment = lambda { |number| number + 1 }
print 'the sum is:'
puts Increment.call(3)

def calculate(num1, num2)
  print 'the sum is:'
  yield(num1, num2)
end
puts calculate(1, 2) { |a, b| a + b }


