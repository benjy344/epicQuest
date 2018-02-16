class QuestsController < ApplicationController

	def index
		@avatar = current_user.avatar
		@quests = Quest.where( unlockLevel: 0..@avatar.countUnlockDonjon)

		@questsTemp = []
		@quests.each do |quest|
			tempQuest = {
				"id"          => quest.id,
				"title"       => quest.title,
				"description" => quest.description,
				"unlockLevel" => quest.unlockLevel,
				"rewardType"  => quest.rewardType,
				"itemToFind"  => Item.find(quest.objetToFind),
				"reward"      => quest.reward,
				"rewardItem"  => quest.reward
			}
			if quest.rewardType != 'gold'
				tempQuest['rewardItem'] = Item.find(quest.reward)
			end
			@questsTemp << tempQuest
		end
	end

	def startQuest
		@avatar = current_user.avatar
	    @quest   = Quest.find(params[:quest_id])

	    @avatar.quests << @quest
	end

	def completQuest
		@avatar = current_user.avatar
	  	@quests = Quest.all
	  	@quest  = Quest.find(params[:quest_id])

	  	@itemTodelete = @avatar.inventory.pockets.where(item_id: @quest.objetToFind).first
	    @avatar.inventory.pockets.delete(@itemTodelete)
	  	if @quest.rewardType === "gold"
	  		@reward      = @quest.reward
	  		@currentGold = @avatar.gold
	  		@newGold     = @currentGold + @reward
	  		@avatar.update(gold: @newGold)
	  	else
	  		@reward = Item.find(@quest.reward)
	  		@avatar.inventory.items << @reward
	  	end

	  	@avQuest = @avatar.quests.where(id: params[:quest_id])
	  	@avQuest.update(done: true)
	end
end
