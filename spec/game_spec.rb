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
  end

  describe '#game_over?' do
    subject(:player_won) { described_class.new }
    won_grid = Array.new(6) { Array.new(7) { 'O' } }
    won_grid[5][1] = 'X'
    won_grid[4][1] = 'X'
    won_grid[3][1] = 'X'
    won_grid[2][1] = 'X'

    let(:winning_board) { instance_double(Board, grid: won_grid) }

    context 'four symbols in a column consecutively' do
      before do
        player_won.instance_variable_set(:@board, winning_board)
      end

      it 'returns true' do
        expect(player_won.game_over?).to be(true)
        player_won.game_over?
      end
    end
  end

  describe '#tie?' do
  end
end
