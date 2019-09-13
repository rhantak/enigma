class KeyGenerator
  def process_num(num)
    number_keys = []
    number_keys << (num[0] + num[1]).to_i
    number_keys << (num[1] + num[2]).to_i
    number_keys << (num[2] + num[3]).to_i
    number_keys << (num[3] + num[4]).to_i
    number_keys
  end

  def process_date(date)
    date = date.to_i
    key_seed = (date * date).to_s[-4..-1]
    date_keys = []
    date_keys << (key_seed[0]).to_i
    date_keys << (key_seed[1]).to_i
    date_keys << (key_seed[2]).to_i
    date_keys << (key_seed[3]).to_i
    date_keys
  end

  def self.process(num, date)
    keygen = KeyGenerator.new
    key_components = [keygen.process_num(num),keygen.process_date(date)]
    key_components.transpose.map(&:sum)
  end
end
