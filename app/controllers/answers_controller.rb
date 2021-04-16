class AnswersController < ApplicationController
    #load_and_authorize_resource
	
	before_action :set_question
	before_action :authenticate_user!, only:[:create, :destroy]
	
	def create
		@answer = @question.answers.new(answer_params)
		@answer.user = current_user
		@answer.save
		redirect_back(fallback_location: root_path)
	end

	def destroy
		@answer = @question.answers.find(params[:id])
		@answer_id = @answer.id
		@answer.destroy
		redirect_to @question
	end

	private
	def answer_params
		params.require(:answer).permit(:body, :link, :question_id)
	end
	def set_question
		@question = Question.find(params[:question_id])
	end
end
