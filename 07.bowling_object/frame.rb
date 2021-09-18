#!/usr/bin/env ruby
# frozen_string_literal: true

class Frame
  def initialize(three_shots, number)
    @number = number
    @shot_one = Shot.new(three_shots[0])
    @shot_two = Shot.new(three_shots[1])
    @shot_three = Shot.new(three_shots[2])
  end

  def frame_score
    if tenth_frame?
      tenth_frame_scores
    elsif strike?
      strike_scores
    elsif spare?
      spare_scores
    else
      other_scores
    end
  end

  private

  def tenth_frame?
    @number == 9
  end

  def strike?
    @shot_one.score == 10
  end

  def spare?
    two_shots_sum == 10
  end

  def tenth_frame_scores
    [three_shots_sum, 0]
  end

  def strike_scores
    [three_shots_sum, 1]
  end

  def spare_scores
    [three_shots_sum, 2]
  end

  def other_scores
    [two_shots_sum, 2]
  end

  def three_shots_sum
    [@shot_one, @shot_two, @shot_three].map(&:score).sum
  end

  def two_shots_sum
    [@shot_one, @shot_two].map(&:score).sum
  end
end
