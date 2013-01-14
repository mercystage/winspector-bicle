class Photo < ActiveRecord::Base
  belongs_to :folder
  attr_accessible :asset, :category, :comment, :folder_id, :open_range, :photo_url, :plays, :user_id
  has_attached_file :asset, :styles => {:big => "1440x1080>", :medium => "360x240>", :thumb => "120x90>" }

  def to_jq_upload
    {
        "name" => read_attribute(:asset_file_name),
        "size" => read_attribute(:asset_file_size),
        "url" => '/photos/' + id.to_s + '/original/' + asset_file_name,
        "thumbnail_url" => '/photos/' + id.to_s + '/thumb/' + asset_file_name,
    }
  end
end
