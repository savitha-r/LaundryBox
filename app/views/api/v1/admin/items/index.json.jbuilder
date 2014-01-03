
json.items @items do |json, item|
  json.(item , :id, :name, :cost)
end