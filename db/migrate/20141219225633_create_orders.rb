class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.integer :zip_code
      t.integer :quantity
      t.timestamps
    end
  end
end
