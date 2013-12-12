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
      raise ArgumentError, "ArgumentError: invalid expression '#{raw_input}'"
    end
  end

  def set_num_type(float_value)
    if float_value.infinite? || float_value.nan?
      return float_value
    else
      as_int = float_value.to_i
      return as_int == float_value ? as_int : float_value
    end
  end

  def build_char_regexp(chars)
    safe_chars = Regexp.escape(chars)
    /[#{safe_chars}]/
  end
end

if __FILE__ == $0
  calc = Calculator.new
  while true do
    begin
      input = gets.chomp
      if input == 'exit'
        break
      elsif input == ''
        next
      else
        puts calc.calculate(input)
      end
    rescue ArgumentError => e
      puts e.message
    end
  end
end
