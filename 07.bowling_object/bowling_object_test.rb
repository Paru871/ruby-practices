# frozen_string_literal: true

require 'minitest/autorun'
require './game'
require './shot'
require './bonus'

class TestBowlingObject < Minitest::Test
  def bowling_object_test01
    score = '6,3,9,0,0,3,8,2,7,3,X,9,1,8,0,X,6,4,5'
    assert_equal 139, Game.new(score).total_score
  end

  def bowling_object_test02
    score = '6,3,9,0,0,3,8,2,7,3,X,9,1,8,0,X,X,X,X'
    assert_equal 164, Game.new(score).total_score
  end

  def bowling_object_test03
    score = '0,10,1,5,0,0,0,0,X,X,X,5,1,8,1,0,4'
    assert_equal 107, Game.new(score).total_score
  end

  def bowling_object_test04
    score = '6,3,9,0,0,3,8,2,7,3,X,9,1,8,0,X,X,0,0'
    assert_equal 134, Game.new(score).total_score
  end

  def bowling_object_test05
    score = 'X,X,X,X,X,X,X,X,X,X,X,X'
    assert_equal 300, Game.new(score).total_score
  end

  def bowling_object_test06
    score = '6,3,9,0,0,3,8,2,7,3,X,9,1,8,0,X,0,0'
    assert_equal 114, Game.new(score).total_score
  end
end
