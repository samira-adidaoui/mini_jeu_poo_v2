require "bundler"
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'


player1 = Player.new("Josiane") 
player2 = Player.new("José")

while player1.life_points > 0 && player2.life_points > 0 do
 puts "Voici l'état de chaque joueur : "
  player1.show_state
  player2.show_state
 puts
 
 
 
 #Début du combat
 puts "Passons à la phase d'attaque"
 
 #Attaque de Josiane
 player1.attacks(player2)
 break if player2.life_points <= 0
 player2.attacks(player1)
 puts
end
 
 #binding.pry