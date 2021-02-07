# frozen_string_literal: true

class ChargesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_charge, only: %i[show edit update destroy]

  # GET /charges or /charges.json
  def index
    @charges = Charge.all
  end

  # GET /charges/1 or /charges/1.json
  def show; end

  # GET /charges/new
  def new
    @charge = Charge.new
  end


  # POST /charges or /charges.json
  def create
    @charge = Charge.new(charge_params)

    respond_to do |format|
      if @charge.charge_over_limit?
        notice_val = "Charge goes over the limit. Available balance is: #{@charge.card.available_balance}"
        format.html { redirect_to @charge, notice: notice_val }
        msg = { id: @charge.card.id, error: 'Insufficient Balance on Card',
                available_balance: @charge.card.available_balance }
        format.json { render json: msg }
      elsif @charge.save
        format.html { redirect_to @charge, notice: 'Charge was successfully created.' }
        format.json { render :show, status: :created, location: @charge }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @charge.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /charges/create or /charge/create
  def create_json
    @charge = Charge.new(card_id: params['charge']['id'], value: params['charge']['value'])
    respond_to do |format|
      if params['charge']['id'].nil?
        msg = { error: 'Please fill out both the Card ID an the Value of the charge.' }
      elsif @charge.charge_over_limit?
        msg = { id: @charge.card_id, error: 'Insufficient Balance on Card',
                available_balance: @charge.card.available_balance }
        format.json { render json: msg }
      elsif @charge.save
        format.html { redirect_to @charge, notice: 'Charge was successfully created.' }
        format.json { render :show, status: :created, location: @charge }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @charge.errors, status: :unprocessable_entity }
      end
    end
  end

  # dont need those right now
  # PATCH/PUT /charges/1 or /charges/1.json
  # def update
  #   respond_to do |format|
  #     if @charge.update(charge_params)
  #       format.html { redirect_to @charge, notice: "Charge was successfully updated." }
  #       format.json { render :show, status: :ok, location: @charge }
  #     else
  #       format.html { render :edit, status: :unprocessable_entity }
  #       format.json { render json: @charge.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # Dont want the destroy right now
  # DELETE /charges/1 or /charges/1.json
  # def destroy
  #   @charge.destroy
  #   respond_to do |format|
  #     format.html { redirect_to charges_url, notice: "Charge was successfully destroyed." }
  #     format.json { head :no_content }
  #   end
  # end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_charge
    @charge = Charge.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def charge_params
    params.require(:charge).permit(:card_id, :value)
  end
end
