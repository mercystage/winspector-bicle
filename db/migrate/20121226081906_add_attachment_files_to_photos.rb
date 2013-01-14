class AddAttachmentFilesToPhotos < ActiveRecord::Migration
  def self.up
    change_table :photos do |t|
      t.attachment :asset
    end
  end

  def self.down
    drop_attached_file :photos, :asset
  end
end
