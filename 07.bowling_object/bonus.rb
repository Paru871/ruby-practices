#!/usr/bin/env ruby
# frozen_string_literal: true

class Bonus
  def initialize(scores, shots)
    @scores = scores
    @shots = shots
  end

  # ストライクとスペアのボーナス計算(9フレームまで)
  def calc_bonus
    @number = 0 # 配列内の位置
    @bonus = 0
    9.times do
      if strike?
        strike_bonus
        @number += 1
      elsif spare?
        spare_bonus
        @number += 2
      else
        @number += 2
      end
    end
    @bonus
  end

  def calc_sum
    @shots.sum
  end

  private

  def strike?
    @scores[@number] == 'X'
  end

  def strike_bonus
    @bonus += @shots[@number + 1]
    @bonus += @shots[@number + 2]
  end

  def spare?
    @shots[@number] + @shots[@number + 1] == 10
  end

  def spare_bonus
    @bonus += @shots[@number + 2]
  end
end
