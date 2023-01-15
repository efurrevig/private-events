class AddColumnOwnerIdToEvents < ActiveRecord::Migration[7.0]
  def change
    add_column :events, :owner_id, :integer
  end
end
