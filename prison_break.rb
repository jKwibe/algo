# frozen_string_literal: true

# QUESTION:
#
# A prisoner is planning to escape  from prison!
# The prison gates consist of horizontal and vertical bars that are spaced one unit apart,
# so the area of each hole between the bars is 1 x 1.
# The prisoner manages to remove certain bars to make some bigger holes.
# Determine the area of the largest hole in the gate after the bars are removed
require 'benchmark'
# n = 6
# m = 6
# h = [4]
# v = [2]

def prison_break(n, m, h, v)

  prison = []
  n.times do # O(n)
    prison << (1..m).to_a
  end

  v.each do |vertical_bar| # O(n**2)
    # set the corresponding index of a vertical bar to nil
    prison.each do |row_of_bars|
      row_of_bars[vertical_bar - 1] = nil
    end
  end

  # set the entire array for a horizontal bar to nil
  h.each do |horizontal_bar| # O(n**2)
    prison[horizontal_bar - 1] = prison[horizontal_bar - 1].map { |bar| nil }
  end

  max_vertical = 1
  max_horizontal = 1

  prison.each_with_index do |row, i| # O(n**2)
    next if h.include?(i + 1)

    streak = 1
    row.each do |column|
      # p row
      if column.nil?
        # p column
        streak += 1
        # p streak
        max_horizontal = streak if streak > max_horizontal
      else
        streak = 1
      end
    end
  end

  (1..m).to_a.each do |num|
    next if v.include?(num)

    streak = 1
    prison.each do |row|
      if row[num - 1].nil?
        streak += 1
        max_vertical = streak if streak > max_vertical
      end
    end
  end

  max_gap = if n == h.length && m == v.length
              n * m
            else
              max_vertical * max_horizontal
            end

  puts max_gap
end

# BigO = O(n**2)

Benchmark.bm do |x|
  x.report { prison_break 6, 6, [4], [2] }
end
