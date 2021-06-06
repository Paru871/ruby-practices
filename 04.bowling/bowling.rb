#!/usr/bin/env ruby
# frozen_string_literal: true

score = ARGV[0]
scores = score.split(',')

# 数字の配列を作る
shots = scores.collect { |s| s == 'X' ? 10 : s.to_i }

# ストライクとスペアのボーナス計算(9フレームまで)
number = 0 # 配列内の位置
bonus = 0
9.times do
  if scores[number] == 'X' # ストライク
    bonus += shots[number + 1]
    bonus += shots[number + 2]
    number += 1
  elsif shots[number] + shots[number + 1] == 10 # スペア
    bonus += shots[number + 2]
    number += 2
  else
    number += 2
  end
end

# 総合計
puts shots.sum + bonus
