class CreateRelationStatuses < ActiveRecord::Migration
  def change
    create_table :relation_statuses do |t|
      t.string :status_code
      t.string :status_name

      t.timestamps
    end
  end
end
