class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :user_id, :null => false
      t.references :folder, :null => false
      t.string :category
      t.string :photo_url
      t.string :open_range
      t.text :comment
      t.integer :plays

      t.timestamps
    end
  end
end
