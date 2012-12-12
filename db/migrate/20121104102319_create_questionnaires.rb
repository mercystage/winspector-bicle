class CreateQuestionnaires < ActiveRecord::Migration
  def change
    create_table :questionnaires do |t|
      t.string :title
      t.text :description
      t.date :end_date

      t.timestamps
    end
  end
end
