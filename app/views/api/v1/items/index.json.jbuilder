@items.each do |i|
	json.item do
		json.name i.name
		json.cost i.cost
	end
end