require 'minitest/autorun'
require './calculator.rb'

describe Calculator, 'calculate simple expressions' do

  before do
    @calc = Calculator.new
  end

  describe 'simple addition' do

    it 'should add single digit numbers and return an integer' do
      @calc.calculate('1+1').must_equal 2
      @calc.calculate('0+1').must_equal 1
      @calc.calculate('3+4').must_equal 7
    end

    it 'should add multi-digit numbers' do
      @calc.calculate('123+456').must_equal 579
      @calc.calculate('999+1').must_equal 1000
      @calc.calculate('11+11').must_equal 22
      @calc.calculate('99+99').must_equal 198
      @calc.calculate('6+7').must_equal 13
    end

    it 'should add single digit numbers ignoring space' do
      @calc.calculate(' 1 + 1 ').must_equal 2
      @calc.calculate(' 0 +1').must_equal 1
      @calc.calculate('3+ 4 ').must_equal 7
      @calc.calculate('4 + 4').must_equal 8
    end
  end

  describe 'appropriate output' do

    it 'should return precise results for fractional math' do
      @calc.calculate('3/4').must_equal 3.0/4.0
      @calc.calculate('4/2').must_equal 4.0/2.0
    end

    it 'should not raise an exception for bad input' do
      @calc.calculate('invalid input!').must_equal "ArgumentError: invalid expression 'invalid input!'"
    end
  end
end