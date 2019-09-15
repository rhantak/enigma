class NumberGenerator
  def generate_digits
    digits = ""
    5.times {digits += rand(10).to_s}
    digits
  end

  def generate_date
  end
end
