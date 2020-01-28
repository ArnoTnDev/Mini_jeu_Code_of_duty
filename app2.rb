require 'bundler'
Bundler.require
require'pry'

require_relative 'lib/game'
require_relative 'lib/player'
puts " -----------------------"
puts "|Welcome on Code of Duty|"
puts "|           ~           |"
puts "|You will be redirected |"
puts "|  on the TERMINAL map  |"
puts "|           ~           |"
puts " -----------------------"

puts "Veuillez choisir le nom de votre personnage"

user = HumanPlayer.new(gets.chomp)
enemies = []
player1 = Player.new("Josianne") 
player2 = Player.new("José") 
enemies << player1
enemies << player2
while user.life_points > 0 && (player1.life_points > 0 || player2.life_points > 0)
    puts user.show_state
    puts"================================"
    puts "Quelle action veux tu effectuer?"
    puts"================================"
    puts"a - chercher une meilleure arme"
    puts"s - chercher à se soigner"
    puts"              ~                "
    puts"Attaquer un joueur en vue :"
    puts"              ~                "
    puts "0 - Josiane a #{player1.life_points} points de vie"
    puts "1 - José a #{player2.life_points} points de vie"
    response = gets.chomp
    if response == "a"
        user.search_weapon
    elsif response == "s"
        user.search_health_pack
    elsif response == "0"
        user.attacks(player1)
    elsif response == "1"
        user.attacks(player2)
    else
        puts "lis la consigne!"
    end
    if player1.life_points > 0 || player2.life_points > 0
    puts "Les autres joueurs t'attaquent !"
    end
    enemies.each do |player|
        if player.life_points > 0
            player.attacks(user)
        end
        
    end

end
puts "La partie est finie soldat"

if user.life_points == 0
    puts "Looser, tu as perdu"
else
    puts"Bravo tu as gagné"
end



binding.pry