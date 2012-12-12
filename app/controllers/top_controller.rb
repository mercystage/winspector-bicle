# -*- coding: utf-8 -*-
class TopController < ApplicationController
  def index
    @winspector = '特警ウインスペクターとは、平和を愛し、友情を信じ、人の命を守る為犯罪に立ち向かう、「警視庁特別救急警察隊」のことである!'
  end

  def login
    user = User.find_by_user_code(params[:user_code])
    if user
      session[:login_user] = user
      redirect_to :controller => 'portal', :action => 'index'
    else
      redirect_to :action => 'index'
    end
  end
end
