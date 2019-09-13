require 'minitest/autorun'
require 'minitest/pride'
require 'mocha/minitest'
require './lib/enigma.rb'
require './lib/key_generator'

class EnigmaTest < Minitest::Test
  def setup
    @enigma = Enigma.new
  end

  def test_it_exists
    assert_instance_of Enigma, @enigma
  end

  def test_it_can_encrypt_messages
    expected = {
      encryption: "keder ohulw",
      key: "02715",
      date: "040895"
    }

    @enigma.stubs(:process).returns([3,27,73,20])
    @enigma.stubs(:generate_shifts).returns()
    @enigma.stubs(:apply_shifts).returns("keder ohulw")
    assert_equal expected, @enigma.encrypt("hello world", "02715", "040895")
  end

  def test_it_can_decrypt_messages
    expected = {
      decryption: "hello world",
      key: "02715",
      date: "040895"
    }
    KeyGenerator.stubs(:process).returns([3,27,73,20])
    @enigma.stubs(:generate_shifts).returns()
    @enigma.stubs(:apply_shifts).returns("hello world")
    assert_equal expected, @enigma.decrypt("keder ohulw", "02715", "040895")
  end
end
