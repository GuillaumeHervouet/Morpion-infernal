require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/board'
require_relative 'lib/player'

puts "Bienvenue dans ce super jeu de morpion".bold.colorize(:light_black)

player1_wins = 0
player2_wins = 0
total_draws = 0

continue_playing = true

while continue_playing
  game = Game.new
  winner = game.play_turn

  if winner == game.player1
    player1_wins += 1
    puts "#{game.player1.name} a remporté cette partie!"
  elsif winner == game.player2
    player2_wins += 1
    puts "#{game.player2.name} a remporté cette partie!"
  else
    total_draws += 1
    puts "C'est une égalité!"
  end

  puts "\nRésumé des parties :"
  puts "#{game.player1.name} a remporté #{player1_wins} partie(s)."
  puts "#{game.player2.name} a remporté #{player2_wins} partie(s)."
  puts "Il y a eu #{total_draws} égalité(s).\n"

  loop do
    puts "Voulez-vous rejouer une nouvelle partie? (oui/non)"
    answer = gets.chomp.downcase

    if answer == "oui"
      break
    elsif answer == "non"
      continue_playing = false
      break
    else
      puts "Écris bien, je n'ai rien compris!"
    end
  end
end

puts "Merci d'avoir joué !"
