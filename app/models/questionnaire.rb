class Questionnaire < ActiveRecord::Base
  attr_accessible :description, :end_date, :title, :questionnaire_votes
  has_many :questionnaire_votes, dependent: :destroy
end
