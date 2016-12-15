require 'verbalize'

class BathroomCode
  include Verbalize::Action

  input :instructions, :keypad

  Position = Struct.new(:x, :y)

  def call
    position = Position.new(*position_of(5))
    code = ''

    instructions.each_line do |line|
      position = perform_instructions(line.chomp, position)
      code << key_at(*position.to_a).to_s
    end

    code
  end

  private

  def position_of(key_to_find)
    keypad.each_with_index do |row, y|
      row.each_with_index do |key, x|
        return [x, y] if key == key_to_find
      end
    end

    raise "The key #{key} does not exist on the keypad!"
  end

  def key_at(x, y)
    keypad[y][x]
  end


  def perform_instructions(line, position)
    line.each_char do |instruction|
      case instruction
      when 'U'
        unless position.y == 0 || key_at(position.x, position.y - 1).nil?
          position.y -= 1
        end
      when 'D'
        unless position.y == (keypad.count - 1) || key_at(position.x, position.y + 1).nil?
          position.y += 1
        end
      when 'L'
        unless position.x == 0 || key_at(position.x - 1, position.y).nil?
          position.x -= 1
        end
      when 'R'
        unless position.x == (keypad[position.y].count - 1) || key_at(position.x + 1, position.y).nil?
          position.x += 1
        end
      end
    end
    position
  end
end
