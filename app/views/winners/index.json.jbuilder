json.array!(@winners) do |winner|
  json.extract! winner, :id
  json.url winner_url(winner, format: :json)
end
