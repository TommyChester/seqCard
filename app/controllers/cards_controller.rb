class CardsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_card, only: %i[ show edit update destroy ]

  # GET /cards or /cards.json
  def index
    @cards = Card.all
  end

  # GET /cards/1 or /cards/1.json
  def show
  end

  # GET /cards/new
  def new
    @card = Card.new
  end

  # GET /cards/1/edit
  def edit
  end

  # POST /cards or /cards.json
  def create
    @card = Card.new(card_params)

    respond_to do |format|
      if @card.save
        format.html { redirect_to @card, notice: "Card was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @card.errors, status: :unprocessable_entity }
      end
    end
  end

  #Post /create from api endpoint
  def create_json
    @card = Card.new(card_params)
    
    respond_to do |format|
      if @card.limit.nil?
        msg = { :id => @card.id, :error => "Must have limit on card"}
        format.json { render :json => msg}
      elsif @card.limit <= 0
        msg = { :id => @card.id, :error => "Cannot have a zero or negative limit"}
        format.json { render :json => msg}
      elsif @card.save
        msg = {:id => @card.id, :limit => @card.limit}
        format.json { render :json => msg}
      else
        format.json { render json: @card.errors, status: :unprocessable_entity }
      end
    end
  end

  def available_balance
    puts card_params, "asdf;lkajsd;lfkjas;dlkfja;sdlkjf;alsdkjf;alsdk"
    @card = Card.find(card_params[:id])
    respond_to do |format|
      if @card
        msg = {:id => @card.id, :available_balance => @card.available_balance}
        format.json { render :json => msg}
      else
        msg {:error => "There is an issue with your request, please try again"}
        format.json { render :json => msg}
      end
    end
  end

  # PATCH/PUT /cards/1 or /cards/1.json
  # def update
  #   respond_to do |format|
  #     if @card.update(card_params)
  #       format.html { redirect_to @card, notice: "Card was successfully updated." }
  #       format.json { render :show, status: :ok, location: @card }
  #     else
  #       format.html { render :edit, status: :unprocessable_entity }
  #       format.json { render json: @card.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /cards/1 or /cards/1.json
  # def destroy
  #   @card.destroy
  #   respond_to do |format|
  #     format.html { redirect_to cards_url, notice: "Card was successfully destroyed." }
  #     format.json { head :no_content }
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_card
      puts '39393', request.path_parameters, "94358{394"
      @card = Card.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def card_params
      params.permit(:card, :limit, :id)

    end
end
