json.quests quests do |quest|
	puts quest.inspect
	json.id          quest['id']
	json.title       quest['title']
	json.description quest['description']
	json.unlockLevel quest['unlockLevel']
	json.rewardType  quest['rewardType']
	json.itemToFind quest['itemToFind']
	json.rewardItem  quest['rewardItem']
end

json.url quest_url(quests, format: :json)