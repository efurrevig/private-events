class Attendee < ApplicationRecord
  belongs_to :user_attendee, class_name: "User"
  belongs_to :event, class_name: "Event"
end
