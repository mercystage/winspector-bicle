class CreatePhotoLikes < ActiveRecord::Migration
  def change
    create_table :photo_likes do |t|
      t.string :photo_id
      t.string :user_id

      t.timestamps
    end
  end
end
