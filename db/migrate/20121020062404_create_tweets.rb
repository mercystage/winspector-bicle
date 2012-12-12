class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.string :user_code
      t.string :tweet_text

      t.timestamps
    end
  end
end
