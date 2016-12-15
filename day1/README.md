# Advent of Code: Day 1

This folder contains a solution for the [2016 Advent of Code: Day 1 problem](http://adventofcode.com/2016/day/1)

## Usage

In this folder, run `bundle install` and then `bundle exec rspec` to run 
the spec files.

## Problem 1

Find the distance from origin in number of city blocks after performing
a set of steps described by an input string. The input string specifies
which direction to turn at each step, followed by a number of blocks to 
walk forward.

To solve an arbitrary problem, where `steps` is the string of steps:

```ruby
require 'distance_calculator'

steps = 'R5, L5, R5, R3'
result = DistanceCalculator.call!(steps: steps)
puts result # => 12
```

## Problem 2

Find the distance from origin in number of city blocks the first time a
particular intersection has been visited more than once.

The steps are provided in the same format as problem 1.

For example:

```ruby
require 'first_visited_twice'

steps = 'R8, R4, R4, R8'
result = FirstVisitedTwice.call!(steps: steps)
puts result # => 4
```
