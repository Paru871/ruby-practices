#!/usr/bin/env ruby
require 'date'
require 'optparse'

options = ARGV.getopts("y:", "m:")
today = Date.today

if options["y"]
  year = options["y"].to_i
else
  year = today.year
end

if options["m"]
  month = options["m"].to_i
else
  month = today.month
end

title = Date.new(year,month,1).strftime("%-m月 %Y")
header = ["日","月","火","水","木","金","土"]

firstday = Date.new(year,month,1).wday  #その月の1日の曜日
lastday = Date.new(year,month,-1).day  #その月の最終日(日数)

day_array = [*1..lastday]
#配列の先頭に1日の曜日数の空白を挿入
firstday.times do  
  day_array.unshift(" ")
end

puts title.center(20)  # 3*7-1
puts header.join(" ")

count = 0
day_array.each do |date|
  print date.to_s.rjust(2) + " "
  count += 1
    if count % 7 == 0  #7個出力したら改行
      print "\n"
    end
end
print "\n"
