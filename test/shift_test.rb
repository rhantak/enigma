require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require 'minitest/pride'
require 'mocha/minitest'
require './lib/shift'

class ShiftTest < Minitest::Test
  def setup
    @shift = Shift.new("encrypt")
    @deshift = Shift.new("decrypt")
    @no_shift_keys = [0,0,0,0]
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
      " " => 0
    }

    assert_equal expected, @shift.character_value
  end

  def test_position_a_shift
    assert_equal "a", @shift.a_shift("a", @no_shift_keys)
    assert_equal "e", @shift.a_shift("a", @staggered_keys)

    assert_equal "a", @deshift.a_shift("a", @no_shift_keys)
    assert_equal "x", @deshift.a_shift("a", @staggered_keys)

    assert_equal "!", @shift.a_shift("!", @staggered_keys)
  end

  def test_position_b_shift
    assert_equal "a", @shift.b_shift("a", @no_shift_keys)
    assert_equal "o", @shift.b_shift("a", @staggered_keys)

    assert_equal "a", @deshift.b_shift("a", @no_shift_keys)
    assert_equal "n", @deshift.b_shift("a", @staggered_keys)

    assert_equal "!", @shift.b_shift("!", @staggered_keys)
  end

  def test_position_c_shift
    type = "encrypt"
    assert_equal "a", @shift.c_shift("a", @no_shift_keys)
    assert_equal "y", @shift.c_shift("a", @staggered_keys)

    type = "decrypt"
    assert_equal "a", @deshift.c_shift("a", @no_shift_keys)
    assert_equal "d", @deshift.c_shift("a", @staggered_keys)

    assert_equal "!", @shift.c_shift("!", @staggered_keys)
  end

  def test_position_d_shift
    type = "encrypt"
    assert_equal "a", @shift.d_shift("a", @no_shift_keys)
    assert_equal "h", @shift.d_shift("a", @staggered_keys)

    type = "decrypt"
    assert_equal "a", @deshift.d_shift("a", @no_shift_keys)
    assert_equal "u", @deshift.d_shift("a", @staggered_keys)

    assert_equal "!", @shift.d_shift("!", @staggered_keys)
  end

  def test_apply_shifts
    hw = "hello world"
    assert_equal hw, Shift.apply_shifts(hw, @no_shift_keys, "encrypt")
    assert_equal "keder ohulw", Shift.apply_shifts(hw, [3,27,73,20], "encrypt")
    assert_equal hw, Shift.apply_shifts(hw, @no_shift_keys, "decrypt")
    assert_equal hw, Shift.apply_shifts("keder ohulw", [3,27,73,20], "decrypt")
  end
end
