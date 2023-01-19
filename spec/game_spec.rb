# frozen_string_literal: true

require './lib/game'


describe Game do
  subject(:game) { described_class.new}

  before do
    allow($stdout).to receive(:puts)
  end
  
  describe "#play_round" do
  
  end

  describe "#verify_input" do
    context 'player puts in valid input' do
      valid_input = 5
      it 'returns true' do
        result = game.verify_input(valid_input)
        expect(result).to be true
      end
    end

    context 'player puts in invalid input' do

    end
  end

  describe "#play_game" do

  end

  describe "#game_over" do

  end

  describe "#tie?" do

  end
end
