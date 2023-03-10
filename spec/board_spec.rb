# frozen_string_literal: true

require './lib/board'
require './lib/symbols'

describe Board do
  include Symbols
  subject(:board) { described_class.new }
  let(:player_symbol) { String.new( 'X' ) }

  describe '#win_row?' do
    context 'there are four symbols in a horiziontal consecutively' do
      let(:won_row) { Array.new(6) { Array.new(7) { empty_circle } } }

      before do
        won_row[0][0] = player_symbol
        won_row[0][1] = player_symbol
        won_row[0][2] = player_symbol
        won_row[0][3] = player_symbol
        board.instance_variable_set(:@grid, won_row)
      end

      it 'returns true' do
        result = board.win_row?(player_symbol)
        expect(result).to be true
      end
    end

    context 'at bottom right grid, there is a row match' do
      let(:won_row) { Array.new(6) { Array.new(7) { empty_circle } } }

      before do
        won_row[5][3] = player_symbol
        won_row[5][4] = player_symbol
        won_row[5][5] = player_symbol
        won_row[5][6] = player_symbol
        board.instance_variable_set(:@grid, won_row)
      end

      it 'returns true' do
        result = board.win_row?(player_symbol)
        expect(result).to be true
      end
    end
  end

  describe '#win_diag_left?' do
    context 'at top left grid, there is a left facing diagonal' do
      let(:won_diag) { Array.new(6) { Array.new(7) { empty_circle } } }

      before do
        won_diag[0][0] = player_symbol
        won_diag[1][1] = player_symbol
        won_diag[2][2] = player_symbol
        won_diag[3][3] = player_symbol
        board.instance_variable_set(:@grid, won_diag)
      end

      it 'returns true' do
        result = board.win_diag_left?(player_symbol)
        expect(result).to be true
      end
    end

    context 'at bottom right grid, there is a left facing diagonal' do
      let(:won_diag) { Array.new(6) { Array.new(7) { empty_circle } } }

      before do
        won_diag[2][3] = player_symbol
        won_diag[3][4] = player_symbol
        won_diag[4][5] = player_symbol
        won_diag[5][6] = player_symbol

        board.instance_variable_set(:@grid, won_diag)
      end

      it 'returns true' do
        result = board.win_diag_left?(player_symbol)
        expect(result).to be true
      end
    end
  end

  describe '#win_diag_right?' do
    context 'at top left corner of grid, there is a right facing diagonal' do
      let(:won_diag) { Array.new(6) { Array.new(7) { empty_circle } } }

      before do
        won_diag[0][3] = player_symbol
        won_diag[1][2] = player_symbol
        won_diag[2][1] = player_symbol
        won_diag[3][0] = player_symbol
        board.instance_variable_set(:@grid, won_diag)
      end

      it 'returns true' do
        result = board.win_diag_right?(player_symbol)
        expect(result).to be true
      end
    end

    context 'at bottom right grid, there is a right facing diagonal' do
      let(:won_diag) { Array.new(6) { Array.new(7) { empty_circle } } }

      before do
        won_diag[2][6] = player_symbol
        won_diag[3][5] = player_symbol
        won_diag[4][4] = player_symbol
        won_diag[5][3] = player_symbol
        board.instance_variable_set(:@grid, won_diag)
      end

      it 'returns true' do
        result = board.win_diag_right?(player_symbol)
        expect(result).to be true
      end
    end
  end

  describe 'win_column?' do
    context 'there is a column match in the top left corner' do
      let(:won_column) { Array.new(6) { Array.new(7) { empty_circle } } }

      before do
        won_column[0..3].each do |row|
          row[0] = player_symbol
        end

        board.instance_variable_set(:@grid, won_column)
      end

      it 'returns true' do
        result = board.win_column?(player_symbol)
        expect(result).to be true
      end
    end

    context 'there is a column match in the bottom right corner' do
      let(:won_column) { Array.new(6) { Array.new(7) { empty_circle } } }

      before do
        won_column[2..5].each do |row|
          row[6] = player_symbol
        end

        board.instance_variable_set(:@grid, won_column)
      end

      it 'returns true' do
        result = board.win_column?(player_symbol)
        expect(result).to be true
      end
    end
  end

  describe '#update_board' do
    context 'on an empty board' do
      subject(:empty_board) { described_class.new }
      let(:blank_grid) { Array.new(6) { Array.new(7) { empty_circle } } }
      let(:updated_grid) { Array.new(6) { Array.new(7) { empty_circle } } }

      before do
        updated_grid[5][1] = player_symbol
      end

      it 'updates selected column with players symbol' do
        valid_input = 1
        expect { empty_board.update_board(valid_input, player_symbol) }.to change {
                                                                      empty_board.grid
                                                                    }.from(blank_grid).to(updated_grid)
      end
    end

    context 'on a board with the bottom half full' do
      subject(:bottom_full_board) { described_class.new }
      let(:bottom_full_grid) { Array.new(6) { Array.new(7) { empty_circle } } }
      let(:updated_grid) { Array.new(6) { Array.new(7) { empty_circle } } }

      before do
        bottom_full_grid[5].map! { player_symbol }

        bottom_full_board.instance_variable_set(:@grid, bottom_full_grid)

        updated_grid[5].map! { player_symbol }

        updated_grid[4][1] = player_symbol
      end

      it 'puts symbol on next row of selected column' do
        valid_input = 1
        expect { bottom_full_board.update_board(valid_input, player_symbol) }.to change {
                                                                            bottom_full_board.grid
                                                                          }.from(bottom_full_grid).to(updated_grid)
      end
    end
  end
end
