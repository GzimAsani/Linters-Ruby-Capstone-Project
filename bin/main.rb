#!/usr/bin/env ruby
# frozen_string_literal: true

# rubocop: disable Lint/AmbiguousBlockAssociation
require_relative '../lib/run_file'

puts 'Hello, this is a linter that helps you check the correct style of your JS files'
puts
current_directory = File.dirname(__FILE__)
pwd = File.expand_path(current_directory)
puts "You are in #{pwd}"
puts
puts 'Please type or paste the path of the folder where you have the files to check'
dir_to_check = gets.chomp

until File.directory?(dir_to_check)
  puts 'That\'s not a valid directory, please try again'
  dir_to_check = gets.chomp
end
puts
puts 'Please select the file from the list below'
puts
files_arr = Dir.children(dir_to_check)
puts files_arr.select { |f| f.end_with?('.js') }
puts
selected_file = gets.chomp

until files_arr.include?(selected_file)
  puts 'Please select a file from the list'
  selected_file = gets.chomp
end
puts
file_data = []
File.foreach("#{dir_to_check}/#{selected_file}") { |line| file_data.push(line) }

file_to_lint = RunFile.new
file_to_lint.message(file_data)

if file_to_lint.tot_errors.positive?
  puts "Found #{file_to_lint.tot_errors} errors"
  file_to_lint.report_mistake.each do |err|
    puts err
  end
else
  puts 'No errors found!'
end
# rubocop: enable Lint/AmbiguousBlockAssociation
