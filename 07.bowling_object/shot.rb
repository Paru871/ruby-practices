#!/usr/bin/env ruby
# frozen_string_literal: true

class Shot
  def initialize(input)
    @input = input
  end

  def separate_scores
    @input.split(',')
  end

  def create_num_scores
    @input.map { |s| s == 'X' ? 10 : s.to_i }
  end
end
