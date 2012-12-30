class PhotoframeController < ApplicationController
  helper_method :detail_hlp

  def get_contents
    @user = session[:login_user]
    @photos = Photo.where(:user_id => @user.id).order('created_at')

    sort = params[:sort]
    if sort == nil
        @folder = Folder.where(:user_id => @user.id).order('f_no')
    else
        @folder = Folder.where(:user_id => @user.id).order(sort)
    end

    @photos.each do |pho|
      if pho.id != nil
        pho.photo_url = '/photos/' + pho.id.to_s + '/'
      end
    end
    @style_url = {
        medium: 'medium/',
        thumb: 'thumb/',
        original: 'original/'
    }
    logger.info(@photos.count)
    logger.info('##############')
  end

  def photohome
    get_contents
  end

  def folder
    get_contents
    @photo = Photo.new
  end

  def regist
  end
end
