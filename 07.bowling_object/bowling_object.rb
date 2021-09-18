#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative 'game'
require_relative 'shot'
require_relative 'frame'

score = ARGV[0]
p Game.new(score).total_score
