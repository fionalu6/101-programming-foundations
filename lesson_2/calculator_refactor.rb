# Modify the prompt
def prompt(message)
  puts "=> #{message}"
end

# Validate the number isn't 0 (or strings)
def valid_number?(number)
  number.to_i.nonzero?
end

# Convert the operator to message strings
def operation_to_message(op)
  case op
  when '1'
    'Adding'
  when '2'
    'Subtracting'
  when '3'
    'Multiplying'
  when '4'
    'Dividing'
  end
end

# Ask the user for their name and greet
prompt("Welcom to the Calculator! What's your name?")

name = ''
loop do
  name = gets.chomp
  if name.empty?()
    prompt("Please enter a valid name")
  else
    break
  end
end

prompt("Hi there, #{name}!")

# Ask the user for two numbers
loop do # main loop
  num1 = ''

  loop do
    prompt("What's the first number?")
    num1 = gets.chomp

    if valid_number?(num1)
      break
    else
      prompt("Oops, that's not a valid number.")
    end
  end

  num2 = ''
  loop do
    prompt("What's the second number?")
    num2 = gets.chomp

    if valid_number?(num2)
      break
    else
      prompt("Oops, that's not a valid number.")
    end
  end

  # Ask the user for an operation to perform

  operator_prompt = <<-MSG
    What operation would you like to perform?
    1) add
    2) subtract
    3) multiply
    4) divide
  MSG

  prompt(operator_prompt)

  operator = ''
  # Validate the operator
  loop do
    operator = gets.chomp

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt("Must enter 1, 2, 3 or 4")
    end
  end

  # Send a opeating message

  prompt("#{operation_to_message(operator)} the two numbers...")

  # Perform the operation on the two numbers
  result = case operator
           when '1'
             num1.to_i + num2.to_i
           when '2'
             num1.to_i - num2.to_i
           when '3'
             num1.to_i * num2.to_i
           when '4'
             num1.to_f / num2.to_f
           end

  # Output the result
  prompt("The result is #{result}")
  prompt("Would you like to do another calculation? Enter Y for yes")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt("Thanks, bye!")
