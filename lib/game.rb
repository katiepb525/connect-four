# frozen_string_literal: true

require './lib/symbols'
require './lib/player'
require './lib/board'

class Game
  include Symbols
  attr_accessor :board, :turn, :player1, :player2

  def initialize
    @player1
    @player2
    @board = Board.new
    @turn = 0
  end

  def get_name(current_player, symbol)
    puts "What is your name, #{current_player}?"
    name = gets.chomp
    Player.new(name, symbol)
  end

  def get_choice(current_player)
    puts "#{ current_player.name }, enter a column number 1-7 to place your symbol."
    gets.chomp.to_i - 1
  end

  def verify_input(input)
    input.instance_of?(Integer) && input.between?(0, 6)
  end

  def play_game
    self.player1 = get_name('player one', heart)
    self.player2 = get_name('player two', star)
    current_player = self.player1
    puts "Player one, you are #{heart}. Player two, you are #{star}."

    until game_over?(current_player) || tie?
      current_player = play_round
      choice = nil

      board.display_board

      until verify_input(choice)
        choice = get_choice(current_player)
      end

      board.update_board(choice, current_player.symbol)
    end
    puts "game over! #{current_player.name} won!"
  end

  def play_round 
    self.turn += 1
    if self.turn.odd? 
      self.player1
    else
      self.player2 
    end
  end

  def game_over?(current_player)
    board.win_row?(current_player.symbol) || board.win_diag_left?(current_player.symbol) || board.win_diag_right?(current_player.symbol) || board.win_column?(current_player.symbol)
  end

  def tie?
    board.grid.include?(empty_circle)
  end
end

# game = Game.new
