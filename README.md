# advent_of_code_2016
Solutions to Advent of Code 2016 problems: http://adventofcode.com/2016

## Usage

In this folder, run `bundle install` and then `bundle exec rspec` to run 
the spec files.

## Advent of Code: Day 1

### Problem 1

Find the distance from origin in number of city blocks after performing
a set of steps described by an input string. The input string specifies
which direction to turn at each step, followed by a number of blocks to 
walk forward.

To solve an arbitrary problem, where `steps` is the string of steps:

```ruby
require 'day1/distance_calculator'

steps = 'R5, L5, R5, R3'
result = DistanceCalculator.call!(steps: steps)
puts result # => 12
```

### Problem 2

Find the distance from origin in number of city blocks the first time a
particular intersection has been visited more than once.

The steps are provided in the same format as problem 1.

For example:

```ruby
require 'day1/first_visited_twice'

steps = 'R8, R4, R4, R8'
result = FirstVisitedTwice.call!(steps: steps)
puts result # => 4
```

## Advent of Code: Day 2

### Problem 1

Find a keypad code for a 9-key pad, based on instructions to move 
relative to the prior key. Each line in the instruction set takes 
you to the next key to press.

You start on the 5 key
 
Example:

```ruby
require 'day2/bathroom_code'

keypad = [[1,2,3],
          [4,5,6],
          [7,8,9]]
instructions = <<EOM
ULL
RRDDD
LURDL
UUUUD
EOM
result = described_class.call!(keypad:       keypad, 
                               instructions: instructions)
puts result # => '1985' 
```

### Problem 2

Same problem as the first, but now with a more complex keypad:

```
    1
  2 3 4
5 6 7 8 9
  A B C
    D
```

Again you start on the 5 key.

When following instructions, you cannot move into an empty space.

```ruby
require 'day2/bathroom_code'

keypad = [
[nil, nil,   1, nil, nil],
[nil,   2,   3,   4, nil],
[  5,   6,   7,   8,   9],
[nil, 'A', 'B', 'C', nil],
[nil, nil, 'D', nil, nil]]
instructions = <<EOM
ULL
RRDDD
LURDL
UUUUD
EOM
result = described_class.call!(keypad:       keypad, 
                               instructions: instructions)
puts result # => '5DB3'
```
