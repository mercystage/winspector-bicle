class AddThumbToFolders < ActiveRecord::Migration
  def change
    add_column :folders, :thumb, :string
  end
end
