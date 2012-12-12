class Photoframe < ActiveRecord::Base
  attr_accessible :comment, :image_url, :user_code
end
