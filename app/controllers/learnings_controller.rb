class LearningsController < ApplicationController
  load_and_authorize_resource
  before_action :set_learning, only: %i[ edit update destroy ]
  before_action :authenticate_user!

  def index
    @learnings = Learning.all
  end

  def new
    @learning = current_user.learnings.build
  end

  def edit
  end

  def create
    @learning = current_user.learnings.build(learning_params)

    respond_to do |format|
      if @learning.save
        format.html { redirect_to @learning, notice: "Lesson was successfully created." }
        format.json { render :show, status: :created, location: @learning }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @learning.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @learning.update(learning_params)
        format.html { redirect_to @learning, notice: "Lesson was successfully updated." }
        format.json { render :show, status: :ok, location: @learning }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @learning.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @learning.destroy
    respond_to do |format|
      format.html { redirect_to learnings_url, notice: "Lesson was successfully deleted." }
      format.json { head :no_content }
    end
  end

  private
    def set_learning
      @learning = Learning.find(params[:id])
    end

    def learning_params
      params.require(:learning).permit(:title, :link, :user_id)
    end
end
