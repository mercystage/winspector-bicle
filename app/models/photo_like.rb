class PhotoLike < ActiveRecord::Base
  attr_accessible :photo_id, :user_id
end
