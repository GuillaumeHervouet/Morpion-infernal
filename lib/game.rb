require_relative 'player'
require_relative 'board'
require 'colorize'

class Game
  attr_reader :player1, :player2, :board

  def initialize
    setup_players
    @player1_wins = 0
    @player2_wins = 0
    @draws = 0
    @board = Board.new
  end

  def launch_game
    loop do
      @board = Board.new
      play_turn

      display_scoreboard
      
      puts " Alors ça rejoue ? (oui ou non)"
      choice = gets.chomp.downcase

      while choice != "oui" && choice != "non"
        puts "Écris bien, j'ai rien compris ! ça rejouer ? (oui ou non)"
        choice = gets.chomp.downcase
      end

      break if choice == "non"
    end
  end

  private

  def setup_players
    puts "ton prénom joueur 1 ?"
    print ">"
    name1 = gets.chomp
    puts "ton symbole, il ne doit faire qu'une lettre"
    print ">"
    symbole1 = gets.chomp[0]

    puts "Joueur 2 maintenant ton prénom ?"
    print ">"
    name2 = gets.chomp
    puts "Et ton super symbole, il ne doit faire qu'une lettre ?"
    print ">"
    symbole2 = gets.chomp[0]

    while symbole2 == symbole1
      puts "Ce symbole est déjà pris par le joueur 1!"
      symbole2 = gets.chomp[0]
    end

    @player1 = Player.new(name1, symbole1)
    @player2 = Player.new(name2, symbole2)

    puts " SUPER CA COMMENCE".bold.colorize(:black)
  end

  def play_turn
    current_player = @player1
    loop do
      @board.display
      ask_for_move(current_player)

      if check_winner(current_player)
        @board.display
        puts "#{current_player.name} TA GAGNER".bold
        
        current_player == @player1 ? @player1_wins += 1 : @player2_wins += 1

        break
      elsif board_full?
        @board.display
        puts " DEUX GROS NUL! EGALITE"
        @draws += 1
        break
      end

      current_player = (current_player == @player1) ? @player2 : @player1
    end
  end

  def ask_for_move(player)
    valid_position = false
    position = ""
    until valid_position
      puts "#{player.name}, où tu te place????? #{player.symbole} ( ex : A1, A2.) ?"
      print ">"
      position = gets.chomp.upcase

      if valid_position_format?(position) && position_empty?(position)
        valid_position = true
      else
        puts " TU SAIS PAS LIRE ?????."
        puts " "
      end
    end
    @board.set_value_at(position, player.symbole)
  end

  def valid_position_format?(position)
    ["A1", "A2", "A3", "B1", "B2", "B3", "C1", "C2", "C3"].include?(position)
  end

  def position_empty?(position)
    @board.get_value_at(position) == " "
  end

  def check_winner(player)
    @board.winner?(player.symbole)
  end

  def board_full?
    @board.get_all_values.none? { |value| value == " " }
  end

  def display_scoreboard
    puts "\nRésumé des parties :"
    puts "#{player1.name} a remporté #{@player1_wins} partie(s)."
    puts "#{player2.name} a remporté #{@player2_wins} partie(s)."
    puts "Il y a eu #{@draws} égalité(s)."
    puts "-----------------------------------\n\n"
  end
end


  

