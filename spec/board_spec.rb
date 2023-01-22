# frozen_string_literal: true

require './lib/board'
require './lib/symbols'

describe Board do
  include Symbols
  subject(:board) { described_class.new }

  describe '#win_row?' do
    context 'there are four symbols in a horiziontal consecutively' do
      won_row = Array.new(6) { Array.new(7) { 'O' } }
      won_row[0][0] = 'X'
      won_row[0][1] = 'X'
      won_row[0][2] = 'X'
      won_row[0][3] = 'X'

      before do
        board.instance_variable_set(:@grid, won_row)
      end

      it 'returns true' do
        result = board.win_row?
        expect(result).to be true
      end
    end

    context 'at bottom right grid, there is a row match' do
      won_row = Array.new(6) { Array.new(7) { 'O' } }
      won_row[5][3] = 'X'
      won_row[5][4] = 'X'
      won_row[5][5] = 'X'
      won_row[5][6] = 'X'

      before do
        board.instance_variable_set(:@grid, won_row)
      end

      it 'returns true' do
        result = board.win_row?
        expect(result).to be true
      end
    end
  end

  describe '#win_diag_left?' do
    context 'at top left grid, there is a left facing diagonal' do
      won_diag = Array.new(6) { Array.new(7) { 'O' } }
      won_diag[0][0] = 'X'
      won_diag[1][1] = 'X'
      won_diag[2][2] = 'X'
      won_diag[3][3] = 'X'

      before do
        board.instance_variable_set(:@grid, won_diag)
      end

      it 'returns true' do
        result = board.win_diag_left?
        expect(result).to be true
      end
    end

    context 'at bottom right grid, there is a left facing diagonal' do
      won_diag = Array.new(6) { Array.new(7) { 'O' } }
      won_diag[2][3] = 'X'
      won_diag[3][4] = 'X'
      won_diag[4][5] = 'X'
      won_diag[5][6] = 'X'

      before do
        board.instance_variable_set(:@grid, won_diag)
      end

      it 'returns true' do
        result = board.win_diag_left?
        expect(result).to be true
      end
    end
  end

  describe '#win_diag_right?' do
    context 'at top left corner of grid, there is a right facing diagonal' do
      won_diag = Array.new(6) { Array.new(7) { 'O' } }
      won_diag[0][3] = 'X'
      won_diag[1][2] = 'X'
      won_diag[2][1] = 'X'
      won_diag[3][0] = 'X'

      before do
        board.instance_variable_set(:@grid, won_diag)
      end

      it 'returns true' do
        result = board.win_diag_right?
        expect(result).to be true
      end
    end

    context 'at bottom right grid, there is a right facing diagonal' do
      won_diag = Array.new(6) { Array.new(7) { 'O' } }
      won_diag[2][6] = 'X'
      won_diag[3][5] = 'X'
      won_diag[4][4] = 'X'
      won_diag[5][3] = 'X'

      before do
        board.instance_variable_set(:@grid, won_diag)
      end

      it 'returns true' do
        result = board.win_diag_right?
        expect(result).to be true
      end
    end
  end

  describe 'win_column?' do
    context 'there is a column match in the top left corner' do
      won_column = Array.new(6) { Array.new(7) { 'O' } }
      won_column[0..3].each do |row|
        row[0] = 'X'
      end

      before do
        board.instance_variable_set(:@grid, won_column)
      end

      it 'returns true' do
        result = board.win_column?
        expect(result).to be true
      end
    end

    context 'there is a column match in the bottom right corner' do
      won_column = Array.new(6) { Array.new(7) { 'O' } }
      won_column[2..5].each do |row|
        row[6] = 'X'
      end

      before do
        board.instance_variable_set(:@grid, won_column)
      end

      it 'returns true' do
        result = board.win_column?
        expect(result).to be true
      end
    end
  end
end
