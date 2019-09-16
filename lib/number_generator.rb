class NumberGenerator
  def generate_digits
    digits = ""
    5.times {digits += rand(10).to_s}
    digits
  end

  def generate_date
    date = Time.now.strftime("%d/%m/%Y")
    date = date.split("/")
    six_digit_date = ""
    date.each {|segment| six_digit_date += segment[-2..-1]}
    six_digit_date
  end

  def self.digits_and_date
    numgen = NumberGenerator.new
    numbers = []
    numbers << numgen.generate_digits
    numbers << numgen.generate_date
    numbers
  end
end
