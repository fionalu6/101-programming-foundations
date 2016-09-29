# Ask the user for two numbers
puts "Welcome to the Calculator!"
puts "What's the first number?"
num1 = gets.chomp
puts "What's the second number?"
num2 = gets.chomp

# Ask the user for an operation to perform
puts "What operation would you like to perform? 1) add 2) subtract 3) multiply 4) divide"
operator = gets.chomp

# Perform the operation on the two numbers
if operator == "1"
  result = num1.to_i + num2.to_i
elsif operator == "2"
  result = num1.to_i - num2.to_i
elsif operator == "3"
  result = num1.to_i * num2.to_i
else
  result = num1.to_f / num2.to_f
end

# Output the result
puts "The result is #{result}"
