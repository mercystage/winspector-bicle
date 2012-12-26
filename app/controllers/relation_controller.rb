# -*- encoding: utf-8 -*-
class RelationController < ApplicationController
  def index
    user = session[:login_user]

    #続柄プルダウンデータを取得
    @relation_type = Relationship.order(:id).map{|relation|[relation.relationship_name, relation.relationship_cd]}

    if !user
      flash[:notice] = 'まずはログインしなさい 話はそれからです'
      redirect_to controller: 'top', action: 'index'
    end

    # ログインユーザの持つつながり（他のユーザとの関係）を取得します
    @relations = UserRelation.find_all_by_user_code(user.user_code)

    respond_to do |format|
      format.js  render '/portal/relationlists'
    end
  end

  def create
    user = session[:login_user]

    # 自分でないかチェック
    if user.user_code == params[:target_user_code]
      flash[:notice] = 'それはおまえだ'
    # 存在しないユーザが指定されていないかチェック
    elsif !User.find_by_user_code(params[:target_user_code])
      flash[:notice] = 'そんなやつはいない'
    # 既に登録済でないかチェック
    elsif UserRelation.where('user_code = ? AND target_user_code = ?', user.user_code, params[:target_user_code]).exists?
      flash[:notice] = 'おまえはすでにつながっている'
    else
      UserRelation.create(user_code: user.user_code, target_user_code: params[:target_user_code], relationship_cd: 1, relation_level: 1, relation_status_code: '2').save
      UserRelation.create(user_code: params[:target_user_code], target_user_code: user.user_code, relationship_cd: 1, relation_level: 1, relation_status_code: '3').save
    end

    render nothing: true
  end

  def edit
  end
end
