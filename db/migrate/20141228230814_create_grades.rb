class CreateGrades < ActiveRecord::Migration
  def change
    create_table :grades do |t|
      t.string :name
      t.decimal :weight, :precision => 15, :scale => 5

      t.timestamps
    end
  end
end
