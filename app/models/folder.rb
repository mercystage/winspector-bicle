class Folder < ActiveRecord::Base
  has_many :photos, :foreign_key => "folder_id"
  attr_accessible :name, :f_no, :user_id
end
