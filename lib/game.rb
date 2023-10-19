require_relative 'player'
require_relative 'board'
require 'colorize'

class Game
  attr_reader :player1, :player2, :board

  def initialize
    # Demande du prénom et du symbole
    puts "Quel est ton prénom joueur 1 ?"
    print ">"
    name1 = gets.chomp
    puts "Choisi maintenant ton symbole, il ne doit faire qu'une lettre"
    print ">"
    symbole1 = gets.chomp[0]

    puts "Joueur 2 maintenant quel est ton prénom ?"
    print ">"
    name2 = gets.chomp
    puts "Et ton super symbole, il ne doit faire qu'une lettre ?"
    print ">"
    symbole2 = gets.chomp[0]

    while symbole2 == symbole1
      puts "Ce symbole est déjà pris par le joueur 1! Essaye en un autre."
      symbole2 = gets.chomp[0]
    end

    puts "Super la partie peut commencer".bold.colorize(:black)

    @player1 = Player.new(name1, symbole1)
    @player2 = Player.new(name2, symbole2)

    # On crée le plateau
    @board = Board.new
  end

  def play_turn
    current_player = @player1
    loop do
      @board.display
      ask_for_move(current_player)

      if check_winner(current_player)
        @board.display
        puts "#{current_player.name} est le gagnant!"
        break
      elsif board_full?
        @board.display
        puts "C'est une égalité!"
        break
      end

      current_player = (current_player == @player1) ? @player2 : @player1
    end
  end

  def ask_for_move(player)
    valid_position = false
    position = ""
    until valid_position
      puts "#{player.name}, où souhaitez-vous placer votre symbole #{player.symbole} (A1, A2... C3) ?"
      print ">"
      position = gets.chomp.upcase

      if valid_position_format?(position) && position_empty?(position)
        valid_position = true
      else
        puts "Position invalide ! Assurez-vous de fournir une position valide et non prise."
      end
    end
    @board.set_value_at(position, player.symbole)
  end

  private

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
end

class Board
  # Assurez-vous d'avoir le reste du code de la classe Board ici.
  
  def winner?(symbol)
    # Lignes
    return true if @grid["A1"] == symbol && @grid["A2"] == symbol && @grid["A3"] == symbol
    return true if @grid["B1"] == symbol && @grid["B2"] == symbol && @grid["B3"] == symbol
    return true if @grid["C1"] == symbol && @grid["C2"] == symbol && @grid["C3"] == symbol

    # Colonnes
    return true if @grid["A1"] == symbol && @grid["B1"] == symbol && @grid["C1"] == symbol
    return true if @grid["A2"] == symbol && @grid["B2"] == symbol && @grid["C2"] == symbol
    return true if @grid["A3"] == symbol && @grid["B3"] == symbol && @grid["C3"] == symbol

    # Diagonales
    return true if @grid["A1"] == symbol && @grid["B2"] == symbol && @grid["C3"] == symbol
    return true if @grid["A3"] == symbol && @grid["B2"] == symbol && @grid["C1"] == symbol

    # Si aucune des conditions ci-dessus n'est satisfaite, il n'y a pas de gagnant pour le moment
    false
  end
end
