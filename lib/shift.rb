class Shift
  attr_reader :character_value, :type
  def initialize(type)
    @character_value = {
      "a" => 1, "b" => 2, "c" => 3,
      "d" => 4, "e" => 5, "f" => 6,
      "g" => 7, "h" => 8, "i" => 9,
      "j" => 10, "k" => 11, "l" => 12,
      "m" => 13, "n" => 14, "o" => 15,
      "p" => 16, "q" => 17, "r" => 18,
      "s" => 19, "t" => 20, "u" => 21,
      "v" => 22, "w" => 23, "x" => 24,
      "y" => 25, "z" => 26, " " => 0
    }
    @type = type
  end

  def a_shift(letter, keys)
    new_value = @character_value[letter] + keys[0] if type == "encrypt"
    new_value = @character_value[letter] - keys[0] if type == "decrypt"
    @character_value.key(new_value % 27)
  end

  def b_shift(letter,keys)
    new_value = @character_value[letter] + keys[1] if type == "encrypt"
    new_value = @character_value[letter] - keys[1] if type == "decrypt"
    @character_value.key(new_value % 27)
  end

  def c_shift(letter, keys)
    new_value = @character_value[letter] + keys[2] if type == "encrypt"
    new_value = @character_value[letter] - keys[2] if type == "decrypt"
    @character_value.key(new_value % 27)
  end

  def d_shift(letter, keys)
    new_value = @character_value[letter] + keys[3] if type == "encrypt"
    new_value = @character_value[letter] - keys[3] if type == "decrypt"
    @character_value.key(new_value % 27)
  end

  def self.apply_shifts(text, keys, type)
    shift = Shift.new(type)
    letters = text.split("")
    shift_position = 0
    new_text = ""
    letters.each do |letter|
      shift_position += 1
      shift_position = 1 if shift_position > 4
      new_text += shift.a_shift(letter, keys) if shift_position == 1
      new_text += shift.b_shift(letter, keys) if shift_position == 2
      new_text += shift.c_shift(letter, keys) if shift_position == 3
      new_text += shift.d_shift(letter, keys) if shift_position == 4
    end
    new_text
  end
end
