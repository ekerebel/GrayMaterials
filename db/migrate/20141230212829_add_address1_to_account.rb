class AddAddress1ToAccount < ActiveRecord::Migration
  def change
    add_column :accounts, :address1, :string
    add_column :accounts, :address2, :string
    add_column :accounts, :city, :string
    add_column :accounts, :state, :string
    add_column :accounts, :zip_code, :integer
  end
end
