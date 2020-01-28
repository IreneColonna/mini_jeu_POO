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
		@weapon_level = 1
	end

	def show_state
	  "#{@name} a #{@life_points} points de vie et une arme de niveau #{@weapon_level}"
	end

	def compute_damage
		rand(1..6) * @weapon_level
	end

end

  def search_weapon
	  new_weapon_level = rand(1..6)
    if new_weapon_level > @weapon_level
			@weapon_level = new_weapon_level
		end
	end

binding.pry
