#!/usr/bin/env ruby
# frozen_string_literal: true

require 'optparse'
require 'etc'

NUMBER_OF_COLUMNS = 3 # 列数を指定、3列で表示（列数変更可)

def main
  options = ARGV.getopts('a', 'r', 'l')

  files = if options['a']
            Dir.glob(['*', '.*']).sort
          else
            Dir.glob('*').sort
          end

  files.reverse! if options['r']

  if options['l']
    print_list(files)
  else
    print_column(files)
  end
end

# 3列で表示（列数変更可)
def print_column(files)
  terminal_width = `tput cols`.chomp.to_i # ターミナルの横幅取得
  row_width = terminal_width / NUMBER_OF_COLUMNS # 1列の幅を算出
  number_of_rows = files.length / NUMBER_OF_COLUMNS + 1 #  段数を算出

  number_of_rows.times do |count|
    NUMBER_OF_COLUMNS.times do |idx|
      if files[count + idx * number_of_rows].nil?
        print ''
      else
        print files[count + idx * number_of_rows].ljust(row_width)
      end
    end
    print "\n"
  end
end

# オプションlのパーミッション部分の変換と作成
def make_permission(stat)
  case stat.ftype
  when 'directory' then file_type = 'd'
  when 'file' then file_type = '-'
  when 'link' then file_type = 'l'
  end

  p1 = convert_permission(stat.mode.to_s(8)[-3, 1])
  p2 = convert_permission(stat.mode.to_s(8)[-2, 1])
  p3 = convert_permission(stat.mode.to_s(8)[-1, 1])
  file_type + p1 + p2 + p3
end

def convert_permission(digit)
  permission = {
    '0' => '---',
    '1' => '--x',
    '2' => '-w-',
    '3' => '-wx',
    '4' => 'r--',
    '5' => 'r-x',
    '6' => 'rw-',
    '7' => 'rwx'
  }
  permission[digit]
end

# オプションlの出力
def print_list(files)
  # 先に前データの stats を作っておく
  row_data = files.map do |file|
    { stats: File::Stat.new(file), file: file }
  end
  # トータルのブロック数を算出と出力
  total_blocks = row_data.sum { |hash| hash[:stats].blocks }
  puts "total #{total_blocks}"
  # データ出力
  row_data.each do |data|
    output_l = [
      make_permission(data[:stats]),
      data[:stats].nlink,
      Etc.getpwuid(data[:stats].uid).name,
      Etc.getgrgid(data[:stats].gid).name,
      data[:stats].size,
      data[:stats].mtime.strftime('%-m %-d %k:%M'),
      data[:file]
    ]
    puts output_l.join('  ')
  end
end

main
