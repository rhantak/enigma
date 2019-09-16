require './lib/enigma'
require './lib/key_generator'
require './lib/number_generator'
require './lib/shift'

file_names = ARGV[0..1]
key = ARGV[2]
date = ARGV[3]
enigma = Enigma.new

if !ARGV[0]
  puts "Please enter the name of the file you wish to decrypt."
elsif !ARGV[1]
  puts "Please enter a file name for the decrypted message."
elsif !ARGV[2] || ARGV[2].length != 5
  puts "Please enter a 5 digit key to use in decryption."
elsif !ARGV[3] || ARGV[3].length != 6
  puts "Please enter a 6 didgit date to use in decryption."
else
  encrypted_file = File.open("text/#{file_names[0]}", "r").read
  encrypted_message = encrypted_file.split('"')[1]

  decrypted_message = enigma.decrypt(encrypted_message, key, date)

  File.open("text/#{file_names[1]}", "w").write(decrypted_message)

  puts "Created '#{file_names[1]}' with the key #{decrypted_message[:key]}, and the date #{decrypted_message[:date]}."
end
