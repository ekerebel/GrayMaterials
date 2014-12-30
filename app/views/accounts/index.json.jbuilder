json.array!(@accounts) do |account|
  json.extract! account, :id, :name, :recipient
  json.url account_url(account, format: :json)
end
