require 'verbalize'
require_relative 'separate_steps'

# This solves http://adventofcode.com/2016/day/1
# To solve for any string of steps `x`, simply call `DistanceCalculator.call!(steps: x)`
# 
# DistanceCalculator.call!(steps: 'R1, R2')

class DistanceCalculator
  include Verbalize::Action

  input :steps

  def call
    parsed_steps = SeparateSteps.call!(steps: steps)
    distance_of(parsed_steps)
  end

  def distance_of(parsed_steps)
    x = y = 0

    parsed_steps.each do |direction, distance|
      case direction
      when :north
        y += distance
      when :east
        x += distance
      when :south
        y -= distance
      when :west
        x -= distance
      end
    end

    x.abs + y.abs
  end
end
