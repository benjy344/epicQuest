class IndexController < ApplicationController

	def town
		@avatar = current_user.avatar
	end

	def worldMap
		@donjons = Donjon.all
		@avatar  = current_user.avatar
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
