# -*- coding:utf-8 -*-
class QuestionnaireController < ApplicationController
  def index
    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def new
    questionnaire = Questionnaire.new title: params[:title],
                                      description: 'アンケート説明',
                                      end_date: '2099-12-31'

    questionnaire.save

    vote1 = questionnaire.questionnaire_votes.build(option_id: '1', option_text: params[:option1])
    vote1.save

    vote2 = questionnaire.questionnaire_votes.build(option_id: '2', option_text: params[:option2])
    vote2.save


    vote3 = questionnaire.questionnaire_votes.build(option_id: '3', option_text: params[:option3])
    vote3.save
    redirect_to controller: 'portal', action: 'index'
  end

  def edit
  end

  def vote
  end
end
