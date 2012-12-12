class CreatePhotoframes < ActiveRecord::Migration
  def change
    create_table :photoframes do |t|
      t.string :user_code
      t.string :image_url
      t.text :comment

      t.timestamps
    end
  end
end
