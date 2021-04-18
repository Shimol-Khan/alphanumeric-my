class CardsController < ApplicationController

  load_and_authorize_resource
  
  before_action :set_card, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  def index
    @cards = Card.all
  end

  def new
    @card = current_user.cards.build
  end

  def show
  end

  def edit
  end

  def create
    @card = current_user.cards.build(card_params)

    respond_to do |format|
      if @card.save
        format.html { redirect_to cards_url, notice: "Card was successfully created." }
        format.json { render :show, status: :created, location: @card }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @card.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @card.update(card_params)
        format.html { redirect_to cards_url, notice: "Card was successfully updated." }
        format.json { render :show, status: :ok, location: @card }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @card.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @card.destroy
    respond_to do |format|
      format.html { redirect_to cards_url, notice: "Card was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_card
      @card = Card.find(params[:id])
    end

    def card_params
      params.require(:card).permit(:question, :answer, :user_id)
    end
end
