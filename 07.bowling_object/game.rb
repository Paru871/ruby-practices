#!/usr/bin/env ruby
# frozen_string_literal: true

class Game
  def initialize(score)
    @score = score
  end

  def total_score
    @scores = Shot.new(@score).separate_scores
    @shots = Shot.new(@scores).create_num_scores
    @bonus = Bonus.new(@scores, @shots).calc_bonus
    @basic_points = Bonus.new(@scores, @shots).calc_sum
    @basic_points + @bonus
  end
end
