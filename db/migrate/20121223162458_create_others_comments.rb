class CreateOthersComments < ActiveRecord::Migration
  def change
    create_table :others_comments do |t|
      t.string :photo_id
      t.string :user_id
      t.text :comment

      t.timestamps
    end
  end
end
