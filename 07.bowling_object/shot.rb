#!/usr/bin/env ruby
# frozen_string_literal: true

class Shot
  attr_reader :score

  def initialize(shot)
    # @shot = shot
    @score = (shot == 'X' ? 10 : shot.to_i)
  end

  # def score
  #   @shot == 'X' ? 10 : @shot.to_i
  # end
end
