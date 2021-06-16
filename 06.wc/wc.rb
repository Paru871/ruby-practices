#!/usr/bin/env ruby
# frozen_string_literal: true

require 'optparse'

def main
  options = ARGV.getopts('l')
  read_files = ARGV

  if options ['l'] && read_files.empty? # オプションlありでファイル指定無し(標準入力)
    standard_input_l
  elsif options ['l']                   # オプションlありでファイル指定あり
    options_l_with_file(read_files)
  elsif read_files.empty?               # オプションl無しでァイル指定無し(標準入力)
    standard_input
  else                                  # オプションl無しでファイル指定あり
    file_operation(read_files)
  end
end

# オプションlありで標準入力時の処理
def standard_input_l
  input = $stdin.read
  print count_lines(input).to_s.rjust(8)
  print "\n"
end

# オプションlありでファイルが指定された時の処理
def options_l_with_file(read_files)
  total_lines = 0
  read_files.each do |file|
    string = File.read(file)
    print count_lines(string).to_s.rjust(8)
    print " #{file}\n"
    total_lines += count_lines(string)
  end
  return unless read_files.length != 1 # ファイルが１つのみの場合はtotal出力なし

  print total_lines.to_s.rjust(8)
  print " total\n"
end

# オプションl無しで標準入力時の処理
def standard_input
  input = $stdin.read
  print count_lines(input).to_s.rjust(8)
  print count_words(input).to_s.rjust(8)
  print count_bytes(input).to_s.rjust(8)
  print "\n"
end

# オプションl無しでファイルが指定された時の処理
def file_operation(read_files)
  total_lines = 0
  total_words = 0
  total_bytes = 0
  read_files.each do |file|
    string = File.read(file)
    print count_lines(string).to_s.rjust(8)
    print count_words(string).to_s.rjust(8)
    print count_bytes(string).to_s.rjust(8)
    print " #{file}\n"
    total_lines += count_lines(string)
    total_words += count_words(string)
    total_bytes += count_bytes(string)
  end

  return unless read_files.length != 1 # ファイルが１つのみの場合はtotal出力なし

  print total_lines.to_s.rjust(8)
  print total_words.to_s.rjust(8)
  print total_bytes.to_s.rjust(8)
  print " total\n"
end

# 行数のカウント
def count_lines(string)
  string.lines.count
end

# 単語数のカウント
def count_words(string)
  array = string.split(/\s+/)
  array.size
end

# バイト数のカウント
def count_bytes(string)
  string.bytesize
end

main
