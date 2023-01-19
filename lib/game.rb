# frozen_string_literal: true

require './lib/symbols'
require './lib/player'
require './lib/board'

class Game
  include Symbols
  attr_reader :player1, :player2

  def initialize
    @player1 = Player.new(get_name('player one'), umbrella)
    @player2 = Player.new(get_name('player two'), cloud)
  end

  def get_name(current_player)
    puts "What is your name, #{current_player}?"
    gets.chomp
  end

  def get_choice
    puts "Enter a column number 1-7 to place your symbol."
    gets.chomp.to_i
  end

  def verify_input(input)
    input.instance_of?(Integer) && input.between?(1,7)
  end
end

# game = Game.new
