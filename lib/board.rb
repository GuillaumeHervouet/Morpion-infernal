require 'colorize'

class Board
  def initialize
    # Initialisation du plateau de jeu avec des cases vides
    @grid = {
      "A1" => " ",
      "A2" => " ",
      "A3" => " ",
      "B1" => " ",
      "B2" => " ",
      "B3" => " ",
      "C1" => " ",
      "C2" => " ",
      "C3" => " ",
    }
  end

  # Affichage du plateau de jeu
  def display
    puts "\n"
    puts "                                        1     2     3 ".colorize(:blue)
    puts "                                     ┌─────┬─────┬─────┐".colorize(:light_black)
    puts "                                   A".colorize(:blue) + " │  #{@grid["A1"]}  │  #{@grid["A2"]}  │  #{@grid["A3"]}  │".colorize(:light_black)
    puts "                                     ├─────┼─────┼─────┤".colorize(:light_black)
    puts "                                   B".colorize(:blue) + " │  #{@grid["B1"]}  │  #{@grid["B2"]}  │  #{@grid["B3"]}  │".colorize(:light_black)
    puts "                                     ├─────┼─────┼─────┤".colorize(:light_black)
    puts "                                   C".colorize(:blue) + " │  #{@grid["C1"]}  │  #{@grid["C2"]}  │  #{@grid["C3"]}  │".colorize(:light_black)
    puts "                                     └─────┴─────┴─────┘".colorize(:light_black)
    puts "\n"
  end

  # Récupère la valeur à une position donnée
  def get_value_at(position)
    @grid[position]
  end

  # Défini la valeur à une position donnée
  def set_value_at(position, symbol)
    @grid[position] = symbol
  end

  # Récupère les valeurs du plateau
  def get_all_values
    @grid.values
  end

  def winner?(symbol)
    # les ligne
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

    # Sinon faux
    false
  end
end

