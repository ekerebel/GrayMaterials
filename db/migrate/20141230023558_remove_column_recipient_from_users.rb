class RemoveColumnRecipientFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :recipient
  end
end
