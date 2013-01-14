class PhotoframeController < ApplicationController
  layout "slideshow_all", :only => 'slideshow_all'

  def get_contents
    @user = session[:login_user]
    if nil != params[:fld]
      @photos = Photo.where(:user_id => @user.id, :folder_id => params[:fld]).order('created_at')
    else
      @photos = Photo.where(:user_id => @user.id).order('created_at')
    end

    order_sort_folders()

    if 0 != @photos.count
      @photos.each do |pho|
        if pho.id != nil
          pho.photo_url = '/photos/' + pho.id.to_s + '/'
        end
      end
      @style_url = {
          big: 'big/',
          medium: 'medium/',
          thumb: 'thumb/',
          original: 'original/'
      }
    end
  end

  def order_sort_folders
    sort = params[:sort]
    if sort == nil
      @my_folders = Folder.where(:user_id => @user.id).order('f_no')
    else
      @my_folders = Folder.where(:user_id => @user.id).order(sort)
    end
  end

  def get_folder_thumb
    folder_img = Magick::Image.read('app/assets/images/back_folder.png').first
    @photos = Photo.where(:folder_id => params[:fld])
    if 0 < @photos.count
      thumb = Magick::Image.read('public/photos/' + @photos.first.id.to_s + '/thumb/' + @photos.first.asset_file_name).first
      folder_img.composite!(thumb, Magick::CenterGravity, Magick::OverCompositeOp)
      send_data(folder_img.to_blob)
    else
      send_data(folder_img.to_blob)
    end
  end

  def photohome
    get_contents
  end

  def slideshow_all
    @photos = Photo.where(user_id: session[:login_user].id)
  end

  def folder
    get_contents
    @folder_param = {
        fld_id: params[:fld],
      fld_name: @my_folders.find(params[:fld]).name
    }
    @photo = Photo.new
  end

  def detail_upload_done
    get_contents
  end

end
