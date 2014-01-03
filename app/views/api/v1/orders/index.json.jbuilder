
json.orders @orders do |json, order|
  json.(order , :id, :cost, :status)
end

