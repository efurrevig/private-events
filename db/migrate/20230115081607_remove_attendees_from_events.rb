class RemoveAttendeesFromEvents < ActiveRecord::Migration[7.0]
  def change
    remove_column :events, :attendees, :integer, array: true, default: []
    remove_column :users, :attended_events, :integer, array: true, default: []
  end
end
