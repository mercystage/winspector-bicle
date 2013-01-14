class CreateFolders < ActiveRecord::Migration
  def change
    create_table :folders do |t|
      t.string :user_id
      t.string :name
      t.integer :f_no

      t.timestamps
    end
  end
end
