json.array!(@shapes) do |shape|
  json.extract! shape, :id, :name, :A, :B, :C, :thickness, :width, :length
  json.url shape_url(shape, format: :json)
end
