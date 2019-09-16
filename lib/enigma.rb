require './lib/key_generator'
require './lib/number_generator'
require './lib/shift'

class Enigma
  def encrypt(text, num = false, date = false)
    text = text.downcase
    seeds = NumberGenerator.digits_and_date
    num = seeds[0] if num == false
    date = seeds[1] if date == false
    keys = KeyGenerator.process(num, date)
    encryption = Shift.apply_shifts(text, keys, "encrypt")
    return {encryption: encryption, key: num, date: date}
  end

  def decrypt(text, num, date = false)
    seeds = NumberGenerator.digits_and_date
    date = seeds[0] if date == false
    text = text.downcase
    keys = KeyGenerator.process(num, date)
    decryption = Shift.apply_shifts(text, keys, "decrypt")
    return {decryption: decryption, key: num, date: date}
  end
end
