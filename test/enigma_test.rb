require 'minitest/autorun'
require 'minitest/pride'
require './lib/enigma.rb'

class EnigmaTest < Minitest::Test
  def setup
    @enigma = Enigma.new("Hello world", "11111", "070694")
  end

  def test_it_exists
    assert_instance_of Enigma, @enigma
  end

  def test_initialize
    assert_equal "Hello world", @enigma.text
    assert_equal "11111", @enigma.num
    assert_equal "070694", @enigma.date
  end
end
