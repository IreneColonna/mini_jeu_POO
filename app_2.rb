require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "------------------------------------------------"
puts "|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |"
puts "|Le but du jeu est d'être le dernier survivant !|"
puts "-------------------------------------------------"


# initialisation du joueur Humain
puts "Quel est ton prénom ?"
print "> " 
name = gets.chomp
player1 = HumanPlayer.new(name)

# initialisation des ennemis
enemies = []
enemy1 = Player.new("Josiane")
enemy2 = Player.new("José")
enemies << enemy1
enemies << enemy2

# lancement du combat 
while player1.life_points > 0 && (enemy1.life_points > 0 || enemy2.life_points > 0)
	puts " "
	puts "-------------"
	player1.show_state

	#menu de décision
	puts "Quelle action veux-tu effectuer ?"
	puts " "
	puts "a - chercher une meilleure arme"
	puts "s - chercher à se soigner"
	puts " "
	puts "attaquer un joueur en vue :"
	if enemy1.life_points > 0
		puts "0 - Josiane a #{enemy1.life_points} points de vie"
	end
	if enemy2.life_points > 0
	puts "1 - José a #{enemy2.life_points} points de vie"
	end 
	print "> "
	action = gets.chomp

	puts " "
	puts "-------------"

	if action == "a"
		player1.search_weapon
	elsif action == "s"
	  player1.search_health_pack
	elsif action.to_i == 0
	  player1.attacks(enemy1)
	elsif action.to_i == 1 
		player1.attacks(enemy2)
	end

	
	if (enemy1.life_points > 0 || enemy2.life_points > 0)
		puts " "
		puts "-------------"
		puts "Les autres joueurs t'attaquent !"
		enemies.each do |enemy|
			if enemy.life_points > 0
			enemy.attacks(player1)
			end
		end 
	end
end

puts "La partie est finie"

if player1.life_points > 0
	puts " "
	puts "BRAVO ! TU AS GAGNE !"
else 
	puts " "
	puts "Loser ! Tu as perdu !" 
end





