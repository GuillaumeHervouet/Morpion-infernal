require_relative 'player'

class Game
    attr_reader :player1, :player2
    def initialize # Permet d'avoir le symbole et le nom des deux joueurs
        
        puts "Quel est ton prénom joueur 1 ?"
        print ">"
        name1 = gets.chomp
        puts "choisi maintenant ton symbole, il ne doit faire qu'une lettre"
        print ">"
        symbole1 = gets.chomp[0]

        puts "Joueur 2 maintenant quel est ton prénom ?"
        print ">"
        name2 = gets.chomp
        puts "et ton super symbole, il ne doit faire qu'une lettre ?"
        print ">"
        symbole2 = gets.chomp[0]
        while symbole2 == symbole1
            puts "Ce symbole est déjà pris par le joueur 1! Essaye en un autre."
            symbole2 = gets.chomp[0]
        end 
        puts "super la partie peut commencer"
        @player1 = Player.new(name1, symbole1)
        @player2 = Player.new(name2, symbole2)

    end
end



