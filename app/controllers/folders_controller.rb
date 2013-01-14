# encoding: utf-8
class FoldersController < ApplicationController
  layout "detail_upload", :only => 'detail_upload'

  def show
    get_contents
  end

  def create
    if  "" != params[:new_folder_name]
        max = Folder.maximum(:f_no)
        # フォルダが無いとき、Maxに＋できない（業務上は無いけど）
        new_param = {
          user_id: session[:login_user].id,
             name: params[:new_folder_name],
             f_no: max + 1
        }
      @folder = Folder.new(new_param)
    else
      flash[:notice] = '作成するフォルダ名を指定してください。'
      redirect_to :controller => 'photoframe', :action => 'get_contents'
      return
    end

    if @folder.save
      redirect_to :controller => 'photoframe', :action => 'get_contents'
    else
      flash[:notice] = 'フォルダが作成できませんでした。'
      redirect_to :controller => 'photoframe', :action => 'get_contents'
    end
  end

  def detail_upload
    get_contents

    @folder_param = {
        fld_id: params[:fld],
        fld_name: Folder.find(params[:fld]).name
    }
    @photo = Photo.new
  end

  def get_contents
    @user = session[:login_user]
    if nil != params[:fld]
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

  def change_name
    new_folder_name = params[:new_fld_name]
    folder_id = params[:fld]
    @folder = Folder.find(folder_id)
    if Folder.find_by_name(new_folder_name)
      flash[:notice] = '同じフォルダ名が存在するため、変更できません。'
      redirect_to :controller => 'photoframe', :action => 'get_contents'
    else if @folder.update_attribute(:name, new_folder_name)
      redirect_to :controller => 'photoframe', :action => 'get_contents'
      else
        flash[:notice] = 'フォルダ名を変更できません。'
      end
    end
  end

  def all_move
    get_contents
    @photos.update_all(:folder_id => params[:move_to])
    redirect_to :controller => 'photoframe', :action => 'get_contents'
  end

  def destroy
    if Photo.find_by_folder_id(params[:id])
      flash[:notice] = 'ファイルが存在するフォルダは削除できません。'
      redirect_to :controller => 'photoframe', :action => 'get_contents'
    else
      Folder.delete(params[:id])
      redirect_to :controller => 'photoframe', :action => 'get_contents'
    end
  end
end
