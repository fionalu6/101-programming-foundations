# Bonus feature 4: Extracting messages
require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

# Define the default language
LANGUAGE = 'en'

# Bonus feature 5: Multiple language
def messages(message, lang='en')
  MESSAGES[lang][message]
end

# Modify the prompt
def prompt(message)
  puts "=> #{message}"
end

# Bonus Feature 1: Better integer validation
def valid_number?(number)
  number.match(/^\d+$/)
end

# Bonus Feature 2: Accept float number
def float?(input)
  /\d/.match(input) && /^\d*\.?\d*$/.match(input)
end

# Convert the operator to message strings
# Bonus Feature 3: Better Case Method
def operation_to_message(op)
  word = case op
         when '1'
           'Adding'
         when '2'
           'Subtracting'
         when '3'
           'Multiplying'
         when '4'
           'Dividing'
         end
  word
end

# Ask the user for their name and greet
prompt(messages('welcome', LANGUAGE))

name = ''
loop do
  name = gets.chomp
  if name.empty?()
    prompt(messages('valid_name', LANGUAGE))
  else
    break
  end
end

prompt("Hi there, #{name}")

# Ask the user for two numbers
loop do # main loop
  num1 = ''

  loop do
    prompt(messages('first_num', LANGUAGE))
    num1 = gets.chomp

    if float?(num1)
      break
    else
      prompt(messages('valid_num', LANGUAGE))
    end
  end

  num2 = ''
  loop do
    prompt(messages('second_num', LANGUAGE))
    num2 = gets.chomp

    if float?(num2)
      break
    else
      prompt(messages('valid_num', LANGUAGE))
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
      prompt(messages('valid_operator', LANGUAGE))
    end
  end

  # Send a opeating message
  prompt("#{operation_to_message(operator)} the two numbers...")

  # Perform the operation on the two numbers
  result = case operator
           when '1'
             num1.to_f + num2.to_f
           when '2'
             num1.to_f - num2.to_f
           when '3'
             num1.to_f * num2.to_f
           when '4'
             num1.to_f / num2.to_f
           end

  # Output the result
  prompt("The result is: #{result}")
  prompt(messages('try_again', LANGUAGE))
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt(messages('goodbye', LANGUAGE))
