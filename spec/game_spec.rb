# frozen_string_literal: true
require './lib/game'

describe Game do
  subject(:game) { described_class.new }

  before do
    allow($stdout).to receive(:puts)
  end

  describe '#play_round' do
    subject(:game_turn) { described_class.new }
    let(:player1) { instance_double(Player, name: 'Sam', symbol: nil) }
    let(:player2) { instance_double(Player, name: 'Callie', symbol: nil) }

    before do
      game_turn.instance_variable_set(:@player1, player1)
      game_turn.instance_variable_set(:@player2, player2)
    end

    context 'turn is an odd number' do
      it 'returns player1' do
        result = game_turn.play_round
        expect(result.name).to be(player1.name)
      end
    end

    context 'turn is an even number' do
      before do
        game_turn.instance_variable_set(:@turn, 1)
      end

      it 'returns player2' do
        result = game_turn.play_round
        expect(result.name).to be(player2.name)
      end
    end
  end

  describe '#verify_input' do
    context 'player puts in valid input' do
      valid_input = 5
      it 'returns true' do
        result = game.verify_input(valid_input)
        expect(result).to be true
      end
    end

    context 'player puts in invalid input' do
      invalid_input = 9
      it 'returns true' do
        result = game.verify_input(invalid_input)
        expect(result).to be false
      end
    end
  end

  describe '#play_game' do
    # should play round until game over OR tie
  end

  describe '#game_over?' do
    subject(:player_won){ described_class.new }
    context 'win_row is true' do
      let(:board) { instance_double(Board, grid: nil) }
      before do
        player_won.instance_variable_set(:@board, board)
        allow(player_won.board).to receive(:win_row?).and_return(true)
      end

      it 'returns true' do
        result = player_won.game_over?
        expect(result).to be true
      end
    end
  end

  describe '#tie?' do
    # checks if the board is full
    subject(:board_full){ described_class.new }

    context 'the board is full' do 
      full_grid = Array.new(6) { Array.new(7) { 'X' } }
      let(:board) { instance_double(Board, grid: full_grid) }

      before do
        board_full.instance_variable_set(:@board, board)
      end

      it 'returns true' do
        result = board_full.tie?
        expect(result).to be true
      end
    end
  end
end
