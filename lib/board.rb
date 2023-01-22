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

  def win_diag_left?
    grid[0..2].each_with_index do |row, idx|
      diag = [grid[idx][idx], grid[idx + 1][idx + 1], grid[idx + 2][idx + 2], grid[idx + 3][idx + 3]]
      return true if diag.all? { |e| e == "X" }
    end

    # catch edge cases (literally)
    grid[0..2].each_with_index do |row, idx|
      diag = [grid[idx][idx + 1], grid[idx + 1][idx + 2], grid[idx + 2][idx + 3], grid[idx + 3][idx + 4]]
      return true if diag.all? { |e| e == "X" }
    end

    false
  end

  def win_diag_right?
    grid[0..2].each_with_index do |row, idx|
      diag = [grid[idx][idx + 3], grid[idx + 1][idx + 2], grid[idx + 2][idx + 1], grid[idx + 3][idx]]
      return true if diag.all? { |e| e == "X" }
    end

    # catch edge cases (literally)
    grid[0..2].each_with_index do |row, idx|
      diag = [grid[idx][idx + 4], grid[idx + 1][idx + 3], grid[idx + 2][idx + 2], grid[idx + 3][idx + 1]]
      return true if diag.all? { |e| e == "X" }
    end
    false
  end

  def win_column?
    7.times do |column_idx|
      current_column = []
      grid[0..2].each_with_index do |row, row_idx|
        current_column = [grid[row_idx][column_idx], grid[row_idx + 1][column_idx], grid[row_idx + 2][column_idx], grid[row_idx + 3][column_idx]]
        return true if current_column.all? { |e| e == 'X' }
      end
    end
    false
  end

  def update_board(column_idx, player_symbol)
    grid.reverse_each do |row|
      if row[column_idx] == empty_circle
        row[column_idx] = player_symbol
        return
      end
    end
    puts 'That column is full. Choose another one.'
  end
end