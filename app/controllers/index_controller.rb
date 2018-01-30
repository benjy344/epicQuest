class IndexController < ApplicationController


	def town
		@quetes = Quete.all
		@avatar = current_user.avatar
		# @objetDroguery = Objet.where('category = "Santé" OR category= "Pierre Magique" OR category = "Matériaux"').order(:price)
		# @objetForge = Objet.where('category = "Armure" OR category= "Arme" OR category = "Défence"').order(:price)
	end
end
