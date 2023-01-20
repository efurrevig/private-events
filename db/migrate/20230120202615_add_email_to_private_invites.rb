class AddEmailToPrivateInvites < ActiveRecord::Migration[7.0]
  def change
    add_column :private_invites, :email, :text
  end
end
