class Calculator
  OPERATORS = '+-*/%'

  def calculate(expression)
    expression.gsub!(/\s+/, '') # Remove all whitespace
    exp_regexp = build_char_regexp(OPERATORS)
    match = exp_regexp.match(expression)
    num_1 = match.pre_match.to_f
    num_2 = match.post_match.to_f
    opr = match.to_s
    num_1.send(opr, num_2)
    # raise ArgumentError, "invalid expression: #{expression}"
  end

  def get_numeric(number_str)
    as_int = number_str.to_i
    as_float = number_str.to_f
    if as_int == as_float
      return as_int
    else
      return as_float
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
    puts calc.calculate gets.chomp
  end
end
