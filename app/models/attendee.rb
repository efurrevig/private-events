class Attendee < ApplicationRecord
  belongs_to :user, foreign_key: "user_id", class_name: "User"
  belongs_to :event, foreign_key: "event_id", class_name: "Event"
  validates :user_id, uniqueness: { scope: :event_id }
end
