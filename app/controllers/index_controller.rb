class IndexController < ApplicationController

	def town
		# @quetes = Quete.all
		@avatar = current_user.avatar
		# @objetDroguery = Objet.where('category = "Santé" OR category= "Pierre Magique" OR category = "Matériaux"').order(:price)
		# @objetForge = Objet.where('category = "Armure" OR category= "Arme" OR category = "Défence"').order(:price)
	end

	def gameover
		@avatar = current_user.avatar
		@gold = @avatar.gold - (@avatar.gold*0.4)
		if @avatar.countUnlockDonjon === 1
			@hpFirst = @avatar.MaxHealth/2
			@avatar.update(gold: @gold, hp: @hpFirst)
		else
			@avatar.update(gold: @gold, hp: 1)
		end
	end
end
