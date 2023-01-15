json.extract! attendee, :id, :user_id, :event_id, :created_at, :updated_at
json.url attendee_url(attendee, format: :json)
