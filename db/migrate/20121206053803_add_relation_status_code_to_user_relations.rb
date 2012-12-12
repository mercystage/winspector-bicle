class AddRelationStatusCodeToUserRelations < ActiveRecord::Migration
  def change
    add_column :user_relations, :relation_status_code, :string
  end
end
