require 'simplecov'
SimpleCov.start

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
    assert_equal 6, @numgen.generate_date.length
    # How to stub this so that it works regardless of system date?
  end

  def test_it_can_generate_digits_and_date
    assert_equal 2, NumberGenerator.digits_and_date.length
    assert_equal 5, NumberGenerator.digits_and_date[0].length
    assert_equal 6, NumberGenerator.digits_and_date[1].length
  end
end
