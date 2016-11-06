json.array!(@skills) do |skill|
  json.extract! skill, :id, :name
end