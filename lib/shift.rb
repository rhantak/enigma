class Shift
  attr_reader :character_value
  def initialize
    @character_value = {
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
  end

  def a_shift(letter, keys)
    new_value = @character_value[letter] + keys[0]
    @character_value.key(new_value % 27)
  end

  def b_shift(letter,keys)
    new_value = @character_value[letter] + keys[1]
    @character_value.key(new_value % 27)
  end

  def c_shift(letter, keys)
    new_value = @character_value[letter] + keys[2]
    @character_value.key(new_value % 27)
  end

  def d_shift(letter, keys)
    new_value = @character_value[letter] + keys[3]
    @character_value.key(new_value % 27)
  end
end