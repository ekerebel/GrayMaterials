class CreateShapes < ActiveRecord::Migration
  def change
    create_table :shapes do |t|
      t.string :name
      t.boolean :A
      t.boolean :B
      t.boolean :C
      t.boolean :thickness
      t.boolean :width
      t.boolean :length

      t.timestamps
    end
  end
end
