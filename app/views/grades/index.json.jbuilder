json.array!(@grades) do |grade|
  json.extract! grade, :id, :name, :weight
  json.url grade_url(grade, format: :json)
end
