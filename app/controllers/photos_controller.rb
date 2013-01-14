# encoding: utf-8
class PhotosController < ApplicationController
  #def show
    # つかってないかも（以前は使ってた）
    #redirect_to(:controller => 'photoframe', :action => 'folder')
  #end

  def index
    # nothing to do
    respond_to do |format|
      format.json {render json: nil }
    end
  end

  def create
    asset = params[:photo][:asset][0]
    pho = {:asset => asset}
    @photo = Photo.new(pho)
    @photo.user_id = session[:login_user].id
    @photo.folder_id = params[:fld_id]
    @photo.comment = "Comment xxxxxxxxxx"

    if nil != @photo.asset
      @photo.save
      #get_contents

      respond_to do |format|
        format.html {
          render :json => [@photo.to_jq_upload].to_json,
                 :content_type => 'text/html',
                 :layout => false
        }
        format.json {
          render json: [@photo.to_jq_upload].to_json, status: :created, location: @photo, :action => 'create'
        }
      end
    else
      flash[:notice] = 'ファイルが指定されていません。'
      get_contents
    end
  end

  def get_contents
    @user = session[:login_user]
    if nil != params[:fld_id]
      @photos = Photo.where(:user_id => @user.id, :folder_id => params[:fld]).order('created_at')
    else
      @photos = Photo.where(:user_id => @user.id).order('created_at')
    end

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

end
