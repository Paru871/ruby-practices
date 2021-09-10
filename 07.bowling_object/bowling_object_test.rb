# frozen_string_literal: true

require 'minitest/autorun'
require './game'
require './shot'
require './bonus'

class BowlingObjectTest < Minitest::Test
  def test_bowling_sample01
    score = '6,3,9,0,0,3,8,2,7,3,X,9,1,8,0,X,6,4,5'
    assert_equal 139,
                 Game.new(score).total_score
  end

  def test_bowling_sample02
    score = '6,3,9,0,0,3,8,2,7,3,X,9,1,8,0,X,X,X,X'
    assert_equal 164,
                 Game.new(score).total_score
  end

  def test_bowling_sample03
    score = '0,10,1,5,0,0,0,0,X,X,X,5,1,8,1,0,4'
    assert_equal 107,
                 Game.new(score).total_score
  end

  def test_bowling_sample04
    score = '6,3,9,0,0,3,8,2,7,3,X,9,1,8,0,X,X,0,0'
    assert_equal 134,
                 Game.new(score).total_score
  end

  def test_bowling_sample05
    score = 'X,X,X,X,X,X,X,X,X,X,X,X'
    assert_equal 300,
                 Game.new(score).total_score
  end

  def test_bowling_sample06
    score = '6,3,9,0,0,3,8,2,7,3,X,9,1,8,0,X,0,0'
    assert_equal 114,
                 Game.new(score).total_score
  end

  def test_bowling_sample07
    score = '6,4,8,0,X,2,7,5,5,3,4,X,9,1,1,2,7,1'
    assert_equal 116,
                 Game.new(score).total_score
  end

  def test_bowling_sample08
    score = '1,8,9,1,7,2,X,0,0,9,1,3,6,8,0,5,4,X,8,1'
    assert_equal 103,
                 Game.new(score).total_score
  end

  def test_bowling_sample09
    score = 'X,1,0,0,3,1,9,8,2,8,2,4,5,9,1,7,0,2,0'
    assert_equal 100,
                 Game.new(score).total_score
  end

  def test_bowling_sample10
    score = '7,3,0,2,X,0,0,X,5,5,X,8,2,3,7,2,5'
    assert_equal 114,
                 Game.new(score).total_score
  end

  def test_bowling_sample11
    score = '5,0,0,10,X,0,8,2,2,2,8,2,2,1,0,6,4,X,0,2'
    assert_equal 104,
                 Game.new(score).total_score
  end
end
