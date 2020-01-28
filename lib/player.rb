class Player
    attr_accessor :name, :life_points

    def initialize(name)
        @life_points = 10
        @name = name
    end
#--------------------------------------------------------------------------   
    def show_state
      return "#{@name} a #{@life_points} points de vie"
    end

#--------------------------------------------------------------------------

    def gets_damage(damage_received = 0)
        @life_points = (@life_points - (damage_received))
        if @life_points <= 0
            puts "le joueur #{name} a été tué X_X"  
        end
    end

#---------------------------------------------------------------------------

    def attacks(player_attacked)
        puts "le joueur #{@name} attaque le joueur #{player_attacked.name}"
        dmg = compute_damage
        puts "il lui inflige #{dmg} points de damage"
        return player_attacked.gets_damage(dmg)
    end

#---------------------------------------------------------------------------

    def compute_damage
        return rand(1..6)
    end


end

#---------------------------------------------------------------------------

class HumanPlayer < Player
    attr_accessor :weapon_level
    def initialize(name)
        @name = name
        @life_points = 100
        @weapon_level = 1
    end

#---------------------------------------------------------------------------

    def show_state
        puts "#{name} a #{life_points} points de vie et une arme de niveau #{weapon_level}"
    end

#---------------------------------------------------------------------------

    def compute_damage
        return rand(1..6) * @weapon_level
    end

#---------------------------------------------------------------------------

    def search_weapon
       new_weapon = rand(1..6)
       puts "Oh! tu as trouvé une arme de niveau #{new_weapon}"
        if new_weapon > @weapon_level
            puts "Youhou ! elle est meilleure que ton arme actuelle : tu la prends."
            @weapon_level = new_weapon
        else
            puts "Elle est pétée ton arme, garde l'ancienne!"
        end
    end

#---------------------------------------------------------------------------

    def search_health_pack
        health = rand(1..6)
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
