require 'verbalize'

class SeparateSteps
  include Verbalize::Action

  input :steps

  DIRECTIONS = [:north, :east, :south, :west]

  def call
    parsed_steps = parse_steps
    current_direction = :north

    parsed_steps.map do |step|
      turn = step[0]
      current_direction = new_direction(turn, current_direction)
      [current_direction, step[1..-1].to_i]
    end
  end

  def parse_steps
     steps.split ', '
  end

  def new_direction(turn, current_direction)
    rotation = (turn == 'R') ? 1 : -1

    new_direction_index = DIRECTIONS.index(current_direction) + rotation
    if new_direction_index >= DIRECTIONS.count
      DIRECTIONS[0]
    else
      DIRECTIONS[new_direction_index]
    end
  end
end
