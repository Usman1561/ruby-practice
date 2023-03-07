puts "Ruby is a beautiful language".start_with?("Ruby")
puts "My Name is Usman".end_with?("Usman")
puts "I am a Rubyist".index("R")
puts 'This is Mixed CASE'.downcase
puts "this is a mixed case".upcase

string_data = "ThiS iS A miXed String Case"
puts string_data.swapcase

p string_data.split

# Concatenation
puts string_data.concat(".")
another_string = " This is a second string added to the string."
puts string_data + another_string # makes a third string 

string_data << another_string # appends to the same string
puts string_data

#Replacing a string

sub_string_data = string_data.sub('second', 'another') #replaces only first instance of char or word
puts sub_string_data

gsub_string_data = string_data.gsub('string', 'stringg') #replaces all instances of same word - case sensitive
puts gsub_string_data

puts string_data.gsub(/[XSA]/,'1') #RegEx provides a concise and flexible means for "matching" or "finding"

'RubyMonk Is Pretty Brilliant'.gsub(/[RMIBP]/,'0')

#Find a substring using RegEx

puts string_data.match(/ ./)
puts string_data.match(/ ./, 7)

# Conditions & Loops Control Structure in Ruby

# && Operator , || Operator (And/Or Operator)
age = 23
name = "Jill"
role = "developer"
puts age >= 23 && ( name == "Bob" || name == "Jill" && ( role == "developer" || role == "manager" ) )

# bang operator !
name = "usman"
puts name != "usman"
puts ! (name == 'Bob')

arr = [1,2,3,4,5]
puts arr[0] != 1


# if else conditional statement
def check_sign(number)
    if number == 0
      "#{number} is zero"
    elsif number > 0
      "#{number} is positive"
    else
      "#{number} is negative"
    end        
  end        
puts check_sign(-10)

#unless condition 

number = 0
unless number > 1
    puts "this is a number greater than zero"
end

#ternary operator: short-hand for an if-then-else construct.

def ternary_operator(num)
    num > 0 ? "#{num} is postive" : "#{num} is negative" 
    # unless num == 0 puts "num is zero" 
    # end
end
puts ternary_operator(2)

# loops 

# loop do
#     monk.meditate
#     break if monk.nirvana?
#   end


# add a loop inside this method to ring the bell 'n' times
# def ring(bell, n)
#     n.times do
#     bell.ring
#     end
# end  
