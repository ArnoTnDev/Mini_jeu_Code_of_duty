require 'bundler'
Bundler.require
require'pry'

require_relative 'lib/game'
require_relative 'lib/player'

player2 = Player.new("José")
player1 = Player.new("Josianne")

puts "A ma droite #{player1.name}"
puts "A ma gauche #{player2.name}"
while player1.life_points > 0 || player2.life_points > 0 do
    puts "Voici l'etat de chaque joueur:"
    puts "--------------------------"
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

binding.pry