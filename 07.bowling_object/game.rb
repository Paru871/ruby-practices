#!/usr/bin/env ruby
# frozen_string_literal: true

class Game
  def initialize(score)
    @score = score
    @points = cal_frames(score)
  end

  def cal_frames(score)
    scores = score.split(',')
    points = []
    index = 0 # 配列内のフレーム開始位置
    10.times do |number|
      frame = Frame.new(scores[index, 3], number)
      frame_points = frame.frame_score
      points << frame_points[0]
      index += frame_points[1]
    end
    points
  end

  def total_score
    @points.sum
  end
end
