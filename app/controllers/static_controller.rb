class StaticController < ApplicationController
  def index
  end

  def browse
    @question = Question.all.order('created_at DESC')
  end
end
