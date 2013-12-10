class Calculator
  OPERATORS = '+-*/%'

  def calculate(raw_input)
    expression = raw_input.gsub(/\s+/, '') # Remove all whitespace
    exp_regexp = build_char_regexp(OPERATORS)
    if match = exp_regexp.match(expression)
      num_1 = match.pre_match.to_f
      num_2 = match.post_match.to_f
      opr = match.to_s
      set_num_type(num_1.send(opr, num_2))
    else
      rescue_bad_input(raw_input)
    end
  end

  def rescue_bad_input(raw_input)
    begin
      raise ArgumentError
    rescue ArgumentError
      print "ArgumentError: invalid expression '#{raw_input}'"
    end
  end

  def set_num_type(number_str)
    as_int = number_str.to_i
    as_float = number_str.to_f
    as_int == as_float ? as_int : as_float
  end

  def build_char_regexp(chars)
    safe_chars = Regexp.escape(chars)
    /[#{safe_chars}]/
  end
end

if __FILE__ == $0
  calc = Calculator.new
  input = true
  while input do
    input = gets.chomp
    if input == 'exit'
      break
    else
      puts calc.calculate(input)
    end
  end
end
