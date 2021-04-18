class StaticController < ApplicationController

  before_action :authenticate_user!, only:[:quiz]

  def index
  end

  def browse
    @question = Question.all.order('created_at DESC')
  end

  def quiz
  end

  def team
    
  end
end
