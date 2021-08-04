json.extract! event, :id, :date, :participant, :duration, :created_at, :updated_at
json.url event_url(event, format: :json)
