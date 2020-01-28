require 'pry'

class Player

  attr_accessor :name, :life_points

  def initialize(name)
    @name = name
    @life_points = 10
  end

  def show_state
    puts "#{@name} a #{@life_points} points de vie"
  end

  def gets_damage(damage_points)
	  @life_points = @life_points - damage_points
		if @life_points <= 0
			puts "le joueur #{@name} a été tué !"
		end
  end

	def attacks(victim)
		puts "le joueur #{@name} attaque #{victim.name}"
		damage_points = compute_damage
		puts "Il lui inflige #{damage_points} points de dommages"
		victim.gets_damage(damage_points)
	end

	def compute_damage
		return rand(1..6)
	end

end

class HumanPlayer < Player 

	attr_accessor :weapon_level

	def initialize(name)
		super(name)
		@life_points = 100
		@weapon_level = 1
	end

	def show_state
	  puts "#{@name} a #{@life_points} points de vie et une arme de niveau #{@weapon_level}"
	end

	def compute_damage
		rand(1..6) * @weapon_level
	end

  def search_weapon
	  new_weapon_level = rand(1..6)
    puts "Tu as trouvé une arme de niveau #{new_weapon_level}"
		if new_weapon_level > @weapon_level
			@weapon_level = new_weapon_level
		else
			puts "Merde... elle n'est pas mieux que ton arme actuelle..."
		end
	end

	def search_health_pack
	  health_level = rand(1..6)
		if health_level == 1
			puts "Tu n'as rien trouvé..."
		elsif health_level > 1 && health_level < 6
			puts "Bravo, tu as trouvé un pack de +50 points de vie !"
			if @life_points + 50 <= 100
				@life_points = @life_points + 50
			else
				@life_points = 100
			end
		else 
			puts "Waow, tu as trouvé un pack de +80 points de vie !"
			if @life_points + 80 <= 100
				@life_points = @life_points + 80
			else
				@life_points = 100
			end
		end
	end

end
