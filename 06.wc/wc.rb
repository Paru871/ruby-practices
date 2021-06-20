#!/usr/bin/env ruby
# frozen_string_literal: true

require 'optparse'
ROW_WIDTH = 8

def main
  @options = ARGV.getopts('l')
  read_files = ARGV
  if read_files.empty? # ファイル指定無し(標準入力)
    standard_input
  else                 # ファイル指定あり
    file_operation(read_files)
  end
end

# ファイル指定無しで標準入力時の処理
def standard_input
  input = $stdin.read
  print input.lines.count.to_s.rjust(ROW_WIDTH)
  unless @options ['l']
    array = input.split(/\s+/)
    print array.size.to_s.rjust(ROW_WIDTH)
    print input.bytesize.to_s.rjust(ROW_WIDTH)
  end
  print "\n"
end

# ファイルが指定された時の処理
def file_operation(read_files)
  @total_lines = 0
  @total_words = 0
  @total_bytes = 0
  read_files.each do |file|
    string = File.read(file)
    array = string.split(/\s+/)
    print string.lines.count.to_s.rjust(ROW_WIDTH)
    unless @options ['l']
      print array.size.to_s.rjust(ROW_WIDTH)
      print string.bytesize.to_s.rjust(ROW_WIDTH)
    end
    print " #{file}\n"
    @total_lines += string.lines.count
    @total_words += array.size
    @total_bytes += string.bytesize
  end
  output_total_lines if read_files[1] # ファイルが2つ以上の時total行出力
end

# total行出力
def output_total_lines
  print @total_lines.to_s.rjust(ROW_WIDTH)
  print @total_words.to_s.rjust(ROW_WIDTH) unless @options ['l']
  print @total_bytes.to_s.rjust(ROW_WIDTH) unless @options ['l']
  print " total\n"
end

main
