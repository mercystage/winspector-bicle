class PhotoframeController < ApplicationController
  def get_contents
    @user = session[:login_user]
    @photos = Photo.where(:user_id => @user.id).order('created_at')

    sort = params[:sort]
    if sort == nil
        @folder = Folder.where(:user_id => @user.id).order('f_no')
    else
        @folder = Folder.where(:user_id => @user.id).order(sort)
    end

    #@folder.each do |fld|
    #logger.info('name = ' + fld.name)
    #end
  end

  def photohome
    get_contents
  end

  def detail
    get_contents
  end

  def folder

  end

  def regist
  end
end
