# Random id Setting　paperclipの:urlをうまく動作させられないのでコメントアウト
#Paperclip::Interpolations[:id_sha1] = proc do |attachment, style|
#  secret_key = "Paperclip Secret Key string"
#  Digest::SHA1.hexdigest("#{attachment.instance.created_at.to_i}#{secret_key}")
#end
