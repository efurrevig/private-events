class AddColumnToEvents < ActiveRecord::Migration[7.0]
  def change
    add_column :events, :attendees, :integer, array: true, default: []
  end
end
