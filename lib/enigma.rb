class Enigma
  def encrypt(text, num,date)
    keys = KeyGenerator.process(num, date)
    generate_shifts(keys)
    encryption = apply_shifts(text)
    return {
      encryption: encryption,
      key: num,
      date: date
    }
  end

  def decrypt(text, num, date)
    keys = KeyGenerator.process(num, date)
    
    decryption = apply_shifts(text)
    return {
      decryption: decryption,
      key: num,
      date: date
    }
  end
end
