#!/usr/bin/env ruby
# frozen_string_literal: true

class Game
  def initialize(score)
    @score = score
    @points = cal_frames(score)
  end

  def total_score
    @points.sum
  end

  private

  def cal_frames(score)
    scores = score.split(',')
    points = []
    index = 0 # 配列内の各フレーム開始位置
    10.times do |number|
      frame = Frame.new(scores[index, 3], number)
      point, shot_num = frame.frame_score
      points << point
      index += shot_num
    end
    points
  end
end
