require 'bundler'
Bundler.require
require'pry'

require_relative 'lib/game'
require_relative 'lib/player'

puts " -----------------------"   #----"Ecran d'accueil" du jeu
puts "|Welcome on Code of Duty|"
puts "|           ~           |"
puts "|You will be redirected |"
puts "|  on the TERMINAL map  |"
puts "|           ~           |"
puts " -----------------------"

puts "Veuillez choisir le nom de votre personnage" #----choix du nom du personnage

user = HumanPlayer.new(gets.chomp)  #---Permet de prendre le nom rentrer par l'utilisateur et de creer un autre type de joueur qui sera une instance de la Classe HumanPlayer
enemies = []
player1 = Player.new("Josianne")  #|----Permet de creer des instances de la Classe Player et de creer deux joueurs ia
player2 = Player.new("José")      #|
enemies << player1 #|---push les instances de classe dans un tableau
enemies << player2 #|
while user.life_points > 0 && (player1.life_points > 0 || player2.life_points > 0) #-----Cette boucle lance les méthodes
    puts user.show_state                                                           # du deuxième programme et indique que pour que le
    puts"================================"                                         # jeu s'arrete lorsquele HumanPlayer a ses points
    puts "Quelle action veux tu effectuer?"                                        # de vie à zéro ou lorsque les deux players ia
    puts"================================"                                         # ont leur point de vie a zéro
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



#binding.pry