class ChangeColumnsOfListings < ActiveRecord::Migration
  def change
    change_column :listings, :length, :decimal, :precision => 15, :scale => 2
    change_column :listings, :width, :decimal, :precision => 15, :scale => 2
    change_column :listings, :thickness, :decimal, :precision => 15, :scale => 2
    change_column :listings, :diameter, :decimal, :precision => 15, :scale => 2
    change_column :listings, :A, :decimal, :precision => 15, :scale => 2
    change_column :listings, :B, :decimal, :precision => 15, :scale => 2
    change_column :listings, :C, :decimal, :precision => 15, :scale => 2
    change_column :listings, :weight, :decimal, :precision => 15, :scale => 2
    change_column :listings, :minimum_weight, :decimal, :precision => 15, :scale => 2
  end
end
