class AddAttachmentImageToShapes < ActiveRecord::Migration
  def self.up
    change_table :shapes do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :shapes, :image
  end
end
