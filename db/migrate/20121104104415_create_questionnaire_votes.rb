class CreateQuestionnaireVotes < ActiveRecord::Migration
  def change
    drop_table :questionnaire_votes
    create_table :questionnaire_votes do |t|
      t.integer :questionnaire_id
      t.string :option_id
      t.string :option_text

      t.timestamps
    end
  end
end
