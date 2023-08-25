# This is the main entrypoint into the program
# It requires the other files/gems that it needs

require './game.rb'
require './player.rb'
require './question.rb'

game_1 = Game.new
game_1.start_game