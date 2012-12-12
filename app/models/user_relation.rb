class UserRelation < ActiveRecord::Base
  attr_accessible :relation_level, :relationship_cd, :target_user_code, :user_code, :relation_status_code
end
