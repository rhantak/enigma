require 'minitest/autorun'
require 'minitest/pride'
require 'mocha/minitest'
require './lib/enigma.rb'
require './lib/key_generator'

class KeyGeneratorTest < Minitest::Test
  def setup
    @keygen = KeyGenerator.new
  end

  def test_it_exists
    assert_instance_of KeyGenerator, @keygen
  end

  def test_it_can_process_a_number
    assert_equal [2,27,71,15], @keygen.process_num("02715")
  end

  def test_it_can_process_a_date
    assert_equal [1,0,2,5], @keygen.process_date("040895")
  end

  def test_process
    assert_equal KeyGenerator.process("02715", "040895"), [3,27,73,20]
  end
end
