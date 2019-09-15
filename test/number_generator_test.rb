require 'minitest/autorun'
require 'minitest/pride'
require 'mocha/minitest'
require './lib/number_generator'

class NumberGeneratorTest < Minitest::Test
  def setup
    @numgen = NumberGenerator.new
  end

  def test_it_exists
    assert_instance_of NumberGenerator, @numgen
  end

  def test_it_can_generate_five_digit_numbers
    test_numbers = []
    1000.times {test_numbers << @numgen.generate_digits}
    test_digits = test_numbers.map {|number| number.length}
    assert_equal 1000, test_numbers.length
    assert_equal 1, test_digits.uniq.length
  end

  def test_it_can_generate_a_six_digit_date
  end
end
