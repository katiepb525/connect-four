# frozen_string_literal: true

require './lib/board'

describe Board do
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
  end

  describe '#win_diag_left?' do
    context 'there are four symbols in a diagonal consecutively' do
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
  end

  describe 'win_column?' do
    context 'there are four symbols in a column consecutively' do
      won_column = Array.new(6) { Array.new(7) { 'O' } }
      won_column[0..3].each do |row|
        row[0] = 'X'
      end

      before do
        board.instance_variable_set(:@grid, won_column)
      end

      it 'returns true' do 
        expect board.win_column?.to be true
      end
      
    end
  end
end