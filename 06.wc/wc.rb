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
  output_section(input) # 集計と出力のメソッドへ
  print "\n"
end

# ファイルが指定された時の処理
def file_operation(read_files)
  @total_lines = 0
  @total_words = 0
  @total_bytes = 0
  read_files.each do |file|
    string = File.read(file)
    output_section(string) # 集計と出力のメソッドへ
    print " #{file}\n"
    @total_lines += string.lines.count
    @total_words += string.split(/\s+/).size
    @total_bytes += string.bytesize
  end
  return unless read_files[1] # ファイルが1つの時はtotal行出力しないでreturn

  print @total_lines.to_s.rjust(ROW_WIDTH)
  print @total_words.to_s.rjust(ROW_WIDTH) unless @options ['l']
  print @total_bytes.to_s.rjust(ROW_WIDTH) unless @options ['l']
  print " total\n"
end

# 集計と出力
def output_section(string)
  print string.lines.count.to_s.rjust(ROW_WIDTH)
  return if @options ['l'] # オプションlありのときは以下出力しないでretuen

  print string.split(/\s+/).size.to_s.rjust(ROW_WIDTH)
  print string.bytesize.to_s.rjust(ROW_WIDTH)
end

main
