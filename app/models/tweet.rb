class Tweet < ActiveRecord::Base
  attr_accessible :tweet_text, :user_code
end
