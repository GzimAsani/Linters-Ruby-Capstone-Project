#!/usr/bin/env ruby
# frozen_string_literal: true

# rubocop: disable Lint/AmbiguousBlockAssociation
require_relative '../lib/run_file'

puts 'Greetings, this file will help you detect your mistakes on Javascript files'
puts
sleep(2.5)
current_directory = File.dirname(__FILE__)
pwd = File.expand_path(current_directory)
puts "You are in #{pwd}"
puts
sleep(2.5)
puts 'Next please write the folder containing Javascript files'
dir_to_check = gets.chomp

until File.directory?(dir_to_check)
  puts 'That\'s not a valid directory, please write a valid directory'
  dir_to_check = gets.chomp
end
puts
puts 'Choose the file that you want to inspect'
puts
files_arr = Dir.children(dir_to_check)
puts files_arr.select { |f| f.end_with?('.js') }
puts
selected_file = gets.chomp

until files_arr.include?(selected_file)
  puts 'Please select a file from the list'
  selected_file = gets.chomp
end
6.times do |i|
  print "Checking you\'re file#{'.' * (i % 4)}   \r"
  $stdout.flush
  sleep(0.5)
end
puts
file_data = []
File.foreach("#{dir_to_check}/#{selected_file}") { |line| file_data.push(line) }

file_to_lint = Runfile.new
file_to_lint.message(file_data)

if file_to_lint.tot_errors.positive?
  puts "Found #{file_to_lint.tot_errors} errors"
  file_to_lint.linters.each do |err|
    puts err
  end
else
  puts 'No errors found!'
end
# rubocop: enable Lint/AmbiguousBlockAssociation
