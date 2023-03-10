class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :events, foreign_key: 'owner_id', dependent: :destroy

  has_many :attendees
  has_many :attended_events, through: :attendees, source: :event

  has_many :private_invites, dependent: :destroy
  has_many :invited_events, through: :private_invites, source: :event
end
