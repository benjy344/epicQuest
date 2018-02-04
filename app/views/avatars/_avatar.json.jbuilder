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

json.url avatar_url(avatar, format: :json)
