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
end
