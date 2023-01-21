# frozen_string_literal: true

require './lib/symbols'

class Board
  include Symbols
  attr_accessor :grid

  def initialize
    # make a 7 x 6 grid
    @grid = Array.new(6) { Array.new(7) { empty_circle } }
  end

  def display_board
    grid.each do |row|
      puts row.join(' ')
    end
    puts (1..7).to_a.join(' ')
  end

  def win_row?
    grid.each do |row|
      index_start = 0
      index_end = 3
      return true if row[index_start..index_end].all? { |e| e == 'X' }

      index_start += 3
      index_end += 3
      return true if row[index_start..index_end].all? { |e| e == 'X' }
    end
  end
end
