class PrivateInvite < ApplicationRecord
  belongs_to :event, foreign_key: 'event_id'
  belongs_to :user, foreign_key: 'user_id'
  validates :user_id, uniqueness: { scope: :event_id }
end
