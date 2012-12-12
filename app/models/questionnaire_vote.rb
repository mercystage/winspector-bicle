class QuestionnaireVote < ActiveRecord::Base
  attr_accessible :option_id, :option_text, :questionnaire_id
  belongs_to :questionnaire
end
