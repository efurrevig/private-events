class AddNameToAttendees < ActiveRecord::Migration[7.0]
  def change
    add_column :attendees, :name, :string
  end
end
