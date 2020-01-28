require 'bundler'
Bundler.require
require'pry'

#-----------------------------------------------------------------

require_relative 'lib/game'   #| Cela permet de lier ce fichier qui lance les méthodes, au fichier du dossier lib là où se trouvent 
require_relative 'lib/player' #| les méthodes à appeller

#-----------------------------------------------------------------

player2 = Player.new("José")    #| Cela creer des instances players1 et player2 de la Classe Player
player1 = Player.new("Josianne")#|

#-----------------------------------------------------------------

puts "A ma droite #{player1.name}"
puts "A ma gauche #{player2.name}"

#-----------------------------------------------------------------

while player1.life_points > 0 || player2.life_points > 0 do #-----Cette boucle lance et organise les méthodes du premier programme et
    puts "Voici l'etat de chaque joueur:"                   #-----indique que lorsqu'un joueur aura ses points de 
    puts "--------------------------"                       #-----vie à zéro le jeu s'arretera.
    puts player1.show_state
    puts player2.show_state
    puts "--------------------------"
    puts"===================================="
    puts "La phase d'attaque commence: FIGHT!"
    puts"===================================="
    player1.attacks(player2)
    puts"             ~              "
    if player2.life_points <= 0
        puts "fin du jeu!"
        break
    end
    player2.attacks(player1)
    puts"             ~              "
    if player1.life_points <= 0
        puts "fin du jeu!"
        break
    end
end

#binding.pry