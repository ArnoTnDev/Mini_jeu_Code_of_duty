class Player #------Class principale qui rassemble toutes les méthodes nécessaire aux programmes
    attr_accessor :name, :life_points

    def initialize(name) #-----Methode qui permet d'injecter du code directement en appelant les instances de classe et d'initialiser
        @life_points = 10      # les stats de base des joueurs ia du jeu.
        @name = name
    end
#-------------------------------------------------------------------------- 

    def show_state #----Methode qui permet de retourner l'etat des points de vie de chaque joueur
      return "#{@name} a #{@life_points} points de vie"
    end

#--------------------------------------------------------------------------

    def gets_damage(damage_received = 0) #----Methode qui permet de calculer les dégâts subis par les joueurs et leur points de vie
        @life_points = (@life_points - (damage_received))
        if @life_points <= 0
            puts "le joueur #{name} a été tué X_X"  
        end
    end

#---------------------------------------------------------------------------

    def attacks(player_attacked) #-------Methode qui permet de donner le montant de l'attaque subie par un joueur
        puts "le joueur #{@name} attaque le joueur #{player_attacked.name}"
        dmg = compute_damage
        puts "il lui inflige #{dmg} points de damage"
        return player_attacked.gets_damage(dmg)
    end

#---------------------------------------------------------------------------

    def compute_damage #-----Methode qui permet de generer un chiffre aléatoire qui sera le montant de l'attaque subi par un joueur
        return rand(1..6)
    end


end

#---------------------------------------------------------------------------

class HumanPlayer < Player #---------Classe nécessaire au deuxième programme, elle hérite des méthode de la première classe 
    attr_accessor :weapon_level    # en en modifiant certaines
    def initialize(name)
        @name = name
        @life_points = 100
        @weapon_level = 1
    end

#---------------------------------------------------------------------------

    def show_state #---- Méthode qui  permet de retourner l'état des points de vie de chaque joueur, mais renseigne aussi sur
        puts "#{name} a #{life_points} points de vie et une arme de niveau #{weapon_level}" #le niveau de l'arme trouvée par HumanPlayer
    end

#---------------------------------------------------------------------------

    def compute_damage #-------------------Méthode qui permet de generer un chiffre aléatoire qui sera la puissance d'attaque de l'arme 
        return rand(1..6) * @weapon_level     #--d'un HumanPlayer, les dégats viendront s'additioner à l'attaque de base fournie 
    end                                       #--par cette même méthode de la Classe Player.

#---------------------------------------------------------------------------

    def search_weapon #-----------------------------------------Méthode qui permet au HumanPlayer de chercher une arme, et de la garder 
       new_weapon = rand(1..6)                                   #si c'elle trouvée a un niveau plus élevée que c'elle qu'il a avant
       puts "Oh! tu as trouvé une arme de niveau #{new_weapon}"  #de lancer la recherche 
        if new_weapon > @weapon_level                             
            puts "Youhou ! elle est meilleure que ton arme actuelle : tu la prends."
            @weapon_level = new_weapon
        else
            puts "Elle est pétée ton arme, garde l'ancienne!"
        end
    end

#---------------------------------------------------------------------------

    def search_health_pack #-------------------------Méthode qui permet au HumanPlayer de chercher un pack de vie qui sera 
        health = rand(1..6)                          #soit égale à 0 à 50 ou a 80 selon le chiffre generer aléatoirement par la méthode
        if health == 1
            puts "Désolé, tu n'as rien trouver"
        elsif health == 6
            puts "Waow, tu as trouvé un pack de +80 points de vie !"
            if @life_points <= 20
                @life_points = @life_points + 80
                return @life_points
            elsif @life_points > 20
                @life_points = 100
                return @life_points
            end
        elsif health = [2..5]
            puts "Bravo, tu as trouvé un pack de +50 points de vie !"
            if  @life_points < 50
                @life_points = @life_points + 50
                return @life_points
            elsif @life_points >= 50
                @life_points = 100
                return @life_points
            end
        end
    end
end
