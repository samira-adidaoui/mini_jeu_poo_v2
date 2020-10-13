class Player
attr_accessor :name, :life_points

    def initialize (name) #initialise le joueur avec son nom et le nombre de vie initial
        @name = name.to_s
        @life_points = 10
    end

    def show_state #nombre de vie restant
        puts "#{@name} a #{@life_points} points de vie"
    end

    def gets_damage(damage_received)
        @life_points = @life_points - damage_received
        if @life_points <= 0 
            puts "le joueur #{@name} a été tué!"
        end
    end

    def attacks(player)
        puts "le joueur #{@name} attaque le joueur #{player.name}"
        damage_attack = compute_damage
        player.gets_damage(damage_attack)
        puts "il lui inflige #{damage_attack} points de dommages"
    end
    def compute_damage
        return rand(1..6)

    end
end

class HumanPlayer < Player
    attr_accessor :weapon_level

    def initialize (name) #initialise le joueur avec son nom et le nombre de vie initial
        @name = name.to_s
        @life_points = 100
        @weapon_level = 1.to_i
    end

    def show_state #nombre de vie restant
        puts "#{@name} a #{@life_points} points de vie et une arme de niveau #{weapon_level}"
    end

    def compute_damage
        rand(1..6) * @weapon_level
    end

    def search_weapon
        weapon_new = rand(1..6) * @weapon_level  
        puts "Tu as trouvé une arme de niveau #{weapon_new} "
         weapon_new > compute_damage
            puts weapon_new
        if
            weapon_new < compute_damage
            puts "Youhou! elle est meilleure que ton arme actuelle : tu la prends"
        else
            weapon_new = compute_damage
            puts "M@*#$... elle n'est pas mieux que ton arme actuelle..."
        end

        
    end
    
    def search_health_pack
        health_pack = rand(1..6)
        puts health_pack

        if health_pack == 1
        puts "Tu n'as rien trouvé"
        
        elsif health_pack <6 
            @life_points =+50 
            if @life_points > 100
                @life_points =100
            end
            puts "Bravo, tu as trouvé un pack de +50 points de vie!"

        else #le résultat est forcément égal à 6
            @life_points =+80 
            if @life_points > 100
                @life_points =100
            end
            puts "Waow, tu as trouvé un pack de +80 points de vie !"
        end
        
    end


end




