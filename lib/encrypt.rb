require './lib/enigma'
require './lib/key_generator'
require './lib/number_generator'
require './lib/shift'

file_names = ARGV
enigma = Enigma.new

if !ARGV[0] && !ARGV[1]
  puts "Please enter the name of the file you wish to encrypt, and a file name for the encrypted message."
elsif !ARGV[0]
  puts "Please enter the name of the file you wish to encrypt."
elsif !ARGV[1]
  puts "Please enter a file name for the encrypted message."
else
  message = File.open("text/#{file_names[0]}", "r").read.chomp

  encrypted_message = enigma.encrypt(message)

  File.open("text/#{file_names[1]}", "w").write(encrypted_message)

  puts "Created '#{file_names[1]}' with the key #{encrypted_message[:key]}, and the date #{encrypted_message[:date]}."
end
