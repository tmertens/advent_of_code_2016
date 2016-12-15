require 'verbalize'
require_relative 'separate_steps'

# This solves http://adventofcode.com/2016/day/1 part 2

class FirstVisitedTwice
  include Verbalize::Action

  input :steps

  def call
    parsed_steps = SeparateSteps.call!(steps: steps)
    current_position = walk_until_deja_vu(parsed_steps)
    distance_from_origin(current_position)
  end

  Position = Struct.new(:x, :y)

  def visited_positions
    @visited_positions ||= [[0,0]]
  end

  def walk_until_deja_vu(steps)
    current_position = Position.new(0, 0)

    steps.take_while do |direction, distance|
      distance.times do
        take_step(current_position, direction)
        return current_position if already_visited?(current_position)
        visited_positions << current_position.to_a
      end
    end

    raise 'I never visited the same place twice!'
  end

  def take_step(current_position, direction)
    case direction
    when :north
      current_position.y += 1
    when :east
      current_position.x += 1
    when :south
      current_position.y -= 1
    when :west
      current_position.x -= 1
    end
  end

  def already_visited?(position)
    visited_positions.include?(position.to_a)
  end

  def distance_from_origin(current_position)
    current_position.x.abs + current_position.y.abs
  end
end
