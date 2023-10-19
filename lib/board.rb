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
  
    # Le plateau de jeu
    def display
    
        puts "\n"  # Pour centrer verticalement quand tu fais ça ça saute une ligne en gros
        puts "                                        1     2     3 ".colorize(:blue)
        puts "                                     ┌─────┬─────┬─────┐".colorize(:light_black)
        puts "                                   A".colorize(:blue)+" │  #{@grid["A1"]}  │  #{@grid["A2"]}  │  #{@grid["A3"]}  │".colorize(:light_black)
        puts "                                     ├─────┼─────┼─────┤".colorize(:light_black)
        puts "                                   B".colorize(:blue)+" │  #{@grid["B1"]}  │  #{@grid["B2"]}  │  #{@grid["B3"]}  │".colorize(:light_black)
        puts "                                     ├─────┼─────┼─────┤".colorize(:light_black)
        puts "                                   C".colorize(:blue)+" │  #{@grid["C1"]}  │  #{@grid["C2"]}  │  #{@grid["C3"]}  │".colorize(:light_black)
        puts "                                     └─────┴─────┴─────┘".colorize(:light_black)
        puts "\n"  # Pareil
      end
      
      def display_title
        puts "\n\n"
        title = "                                      LE MORPION ROYAL".bold.colorize(:red)
        puts title
        
      end





    # Ajout d'un symbole à une position donnée sur le plateau
    def add_symbol(position, symbol)
      if is_empty?(position)
        @grid[position] = symbol
        true
      else
        false
      end
    end
  
    # Vérification si une position est vide
    def is_empty?(position)
      @grid[position] == " "
    end
  end
  
board = Board.new
board.display_title
board.display

