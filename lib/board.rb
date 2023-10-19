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

  # Récupère toutes les valeurs du plateau
  def get_all_values
    @grid.values
  end
end
