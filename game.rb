require './player.rb'
require './question.rb'

class Game
  @@current_player = @player_1

  attr_reader :player_1, :player_2, :lives

  def initialize
    @player_1 = Player.new
    @player_2 = Player.new
    @lives = 3
  end

  def show_game_status
    puts "P1: #{player_1.lives}/#{@lives} vs P2: #{player_2.lives}/#{@lives}"
  end

  def game_over?
    player_1.alive? == false || player_2.alive? == false
  end

  def show_end_game_message
    puts "----- GAME OVER -----"
    puts "Good bye!"
  end

  def show_result(player, is_correct)
    player_string = player == @player_1 ? "Player 1" : "Player 2"
    response = is_correct == true ? "YES! You are correct." : "Seriously? No!"
    puts "#{player_string}: #{response}"
  end

  def show_winner(player)
    player_string = player == @player_1 ? "Player 1" : "Player 2"
    puts "#{player_string} wins with a score of #{player.lives}/#{@lives}"
  end

  def get_winner
    @player_1.alive? ? @player_1 : @player_2
  end

  def start_game
    @@current_player = @player_1
    while !self.game_over?
      puts "----- NEW TURN -----"
      q = Question.new
      player_string = @@current_player == @player_1 ? "Player 1" : "Player 2"
      puts "#{player_string}: #{q.question_string}"
      user_response = gets.chomp.to_i
      is_correct = q.answered_correctly?(user_response)
      show_result(@@current_player, is_correct)
      if !is_correct
        @@current_player.loose_life
      end
      @@current_player == @player_1 ? @@current_player = @player_2 :  @@current_player = @player_1
      show_game_status()
    end
    show_winner(get_winner())
    show_end_game_message()
  end
end