class CreatePhotoTags < ActiveRecord::Migration
  def change
    create_table :photo_tags do |t|
      t.string :photo_id
      t.string :user_id

      t.timestamps
    end
  end
end
