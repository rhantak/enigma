require 'minitest/autorun'
require 'minitest/pride'
require 'mocha/minitest'
require './lib/generate_shifts'

class ShiftTest < Minitest::Test
  def setup
    @shift = Shift.new
    @no_shift_keys = [0,0,0,0]
    @one_shift_keys = [1,1,1,1]
    @ten_shift_keys = [10,10,10,10]
    @staggered_keys = [31,41,51,61]
  end

  def test_it_exists
    assert_instance_of Shift, @shift
  end

  def test_initialize
    expected = {
      "a" => 1,
      "b" => 2,
      "c" => 3,
      "d" => 4,
      "e" => 5,
      "f" => 6,
      "g" => 7,
      "h" => 8,
      "i" => 9,
      "j" => 10,
      "k" => 11,
      "l" => 12,
      "m" => 13,
      "n" => 14,
      "o" => 15,
      "p" => 16,
      "q" => 17,
      "r" => 18,
      "s" => 19,
      "t" => 20,
      "u" => 21,
      "v" => 22,
      "w" => 23,
      "x" => 24,
      "y" => 25,
      "z" => 26,
      " " => 27
    }

    assert_equal expected, @shift.character_value
  end

  def test_position_a_shift
    assert_equal "a", @shift.a_shift("a", @no_shift_keys)
    assert_equal "b", @shift.a_shift("a", @one_shift_keys)
    assert_equal "k", @shift.a_shift("a", @ten_shift_keys)
    assert_equal "e", @shift.a_shift("a", @staggered_keys)
  end

  def test_position_b_shift
    assert_equal "a", @shift.b_shift("a", @no_shift_keys)
    assert_equal "b", @shift.b_shift("a", @one_shift_keys)
    assert_equal "k", @shift.b_shift("a", @ten_shift_keys)
    assert_equal "o", @shift.b_shift("a", @staggered_keys)
  end

  def test_position_c_shift
    assert_equal "a", @shift.c_shift("a", @no_shift_keys)
    assert_equal "b", @shift.c_shift("a", @one_shift_keys)
    assert_equal "k", @shift.c_shift("a", @ten_shift_keys)
    assert_equal "y", @shift.c_shift("a", @staggered_keys)
  end

  def test_position_d_shift
    assert_equal "a", @shift.d_shift("a", @no_shift_keys)
    assert_equal "b", @shift.d_shift("a", @one_shift_keys)
    assert_equal "k", @shift.d_shift("a", @ten_shift_keys)
    assert_equal "h", @shift.d_shift("a", @staggered_keys)
  end
end
