# -*- coding: utf-8 -*-
class PortalController < ApplicationController
  def index
    @user = session[:login_user]

    #続柄プルダウンデータを取得
    @relation_type = Relationship.order(:id).map{|relation|[relation.relationship_name, relation.relationship_cd]}

    # ログインユーザの持つ承認済のつながり（他のユーザとの関係）を取得します
    @relations = UserRelation.where('user_code = :user_code AND relation_status_code = :relation_status_code',
                                    {user_code: @user.user_code, relation_status_code: '1'})

    # ログインユーザの持つ未承認のつながり（他のユーザとの関係）を取得します
    @pre_relations = UserRelation.where('user_code = :user_code AND relation_status_code != :relation_status_code',
                                        {user_code: @user.user_code, relation_status_code: '1'})

    #tweet-tlの初期データを取得
    relations = UserRelation.find_all_by_user_code(@user.user_code)

    relation_user_codes = Array.new relations.length
    relation_user_codes << @user.user_code
    relations.each do |relation|
      relation_user_codes << relation.target_user_code
    end

    @tweets = Tweet.where("user_code in(?)", relation_user_codes).order("created_at DESC").offset(0).limit(20)

    @photos = Photo.find_all_by_user_id(session[:login_user].id)
    @questionnaires = Questionnaire.all
  end

  def tweet
    user = session[:login_user]
    tweet = Tweet.new user_code: user.user_code ,tweet_text: params[:tweet_text]
    tweet.save
    redirect_to action: 'index'
  end

  def gettweet
    @user = session[:login_user]
    relations = UserRelation.find_all_by_user_code(@user.user_code)

    relation_user_codes = Array.new relations.length
    relation_user_codes << @user.user_code
    relations.each do |relation|
      relation_user_codes << relation.target_user_code
    end

    @tweets = Tweet.where("user_code in(?)", relation_user_codes).order("created_at DESC").offset(params[:offset]).limit(10)
    @offset = params[:offset].to_i + 10
    respond_to do |format|
      format.js
    end
  end

  def relations
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
      format.js
    end
  end

  def prerelations
    user = session[:login_user]

    if !user
      flash[:notice] = 'まずはログインしなさい 話はそれからです'
      redirect_to controller: 'top', action: 'index'
    end

    # ログインユーザの持つ未承認のつながり（他のユーザとの関係）を取得します
    @pre_relations = UserRelation.where('user_code = :user_code AND relation_status_code != :relation_status_code',
                                        {user_code: user.user_code, relation_status_code: '1'})

    respond_to do |format|
      format.js
    end
  end
end
