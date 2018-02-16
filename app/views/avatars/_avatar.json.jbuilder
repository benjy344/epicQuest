json.avatar avatar
json.items avatar.inventory.items do |item|
	json.id item.id
	json.name item.name
	json.description item.description
	json.rarity item.rarity
	json.health item.health
	json.force item.force
	json.agility item.agility
	json.price item.price
	json.defence item.defence
	json.category item.category
end
json.quests avatar.quests do |quest|
	json.id quest.id
	json.title quest.title
	json.description quest.description
	json.unlockLevel quest.unlockLevel
	json.done quest.done
	json.rewardType quest.rewardType
	json.objetToFind quest.objetToFind
	json.reward quest.reward
end

json.url avatar_url(avatar, format: :json)
