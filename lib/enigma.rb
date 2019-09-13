class Enigma
  attr_reader :text, :num, :date

  def initialize(text, num, date)
    @text = text
    @num = num
    @date = date
  end

  def encrypt
    keys = process(num, date)
    generate_shifts(keys)
    encryption = apply_shifts(text)
    return {
      encryption: encryption,
      key: num,
      date: date
    }
  end

  def decrypt
    keys = process(num, date)
    generate_shifts(keys)
    decryption = apply_shifts(text)
    return {
      decryption: decryption,
      key: num,
      date: date
    }
  end
end
