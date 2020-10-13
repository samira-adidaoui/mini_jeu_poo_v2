require "bundler"
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "------------------------------------------------"
puts "|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |"
puts "|Le but du jeu est d'être le dernier survivant !|"
puts "-------------------------------------------------"


puts = "Choisi un prénom"
prenom = gets.chomp.to_s


user = HumanPlayer.new(prenom)
player1 = Player.new("Josiane")
player2 = Player.new("José")

enemies = [player1, player2]

while user.life_points > 0 && (player1).life_points > 0 || (player2).life_points >0
    puts user.show_state
    puts
    puts "Quelle action veux-tu effectuer"
    puts
    puts "a - chercher une meilleure arme"
    puts "s - chercher à se soigner "
    puts
    puts "attaquer un joueur en vue :"
    print "0 -"
    if player1.life_points <= 0 #statut de vie positif
        player1.life_points = 0
    else
    end
    player1.show_state

    print "1 -"
    if player2.life_points <= 0 #statut de vie positif
        player2.life_points = 0
    else
    end
    player2.show_state
    

    action = gets.chomp.to_s
    
    if action == "a" 
        then user.search_weapon   

    elsif action == "s" 
        then user.search_health_pack
        
    elsif action == "0"
        then user.attacks(player1)

    elsif action == "1"
        then user.attacks(player2)
        
    else 
        puts "Error - entrée incorrecte. Veuillez selectionner une entrée correcte"
    end
    
    
    puts "Les autres joueurs t'attaquent"
    enemies.each do |enemy|
        enemy.attacks(user)
        if enemy.life_points <= 0
        else
        end
    end
end
puts "la partie est finie"
    if user.life_points > 0 && enemies.life_points <= 0
        puts "BRAVO ! TU AS GAGNE"
    else 
        puts "Loser! Tu as perdu!"
    end

 #binding.pry