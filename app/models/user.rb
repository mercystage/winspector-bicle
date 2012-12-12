class User < ActiveRecord::Base
  attr_accessible :nick_name, :password, :user_code
end
