class Event < ApplicationRecord
    belongs_to :owner, foreign_key: 'owner_id', class_name: "User"
    has_many :attendees, foreign_key: 'event_id', dependent: :destroy
    has_many :user_attendees, through: :attendees, source: :user
end
