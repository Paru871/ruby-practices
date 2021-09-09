#!/usr/bin/env ruby
# frozen_string_literal: true

require './game'
require './shot'
require './bonus'

score = ARGV[0]
p Game.new(score).total_score
