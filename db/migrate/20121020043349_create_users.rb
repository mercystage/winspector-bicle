class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :user_code
      t.string :nick_name
      t.string :password

      t.timestamps
    end
  end
end
