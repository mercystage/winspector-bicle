class CreateUserRelations < ActiveRecord::Migration
  def change
    create_table :user_relations do |t|
      t.string :user_code
      t.string :target_user_code
      t.integer :relationship_cd
      t.integer :relation_level

      t.timestamps
    end
  end
end
