class Event < ApplicationRecord
    belongs_to :owner, foreign_key: 'owner_id', class_name: "User"

    has_many :attendees, foreign_key: 'event_id', dependent: :destroy
    has_many :user_attendees, through: :attendees, source: :user

    has_many :private_invites, foreign_key: 'event_id', dependent: :destroy
    has_many :invited_users, through: :private_invites, source: :user
end
