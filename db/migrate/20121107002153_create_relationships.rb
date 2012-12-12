class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.integer :relationship_cd
      t.string :relationship_name

      t.timestamps
    end
  end
end
