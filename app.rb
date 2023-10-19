require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/board'

game = Game.new
game.launch_game
