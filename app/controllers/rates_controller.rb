class RatesController < ApplicationController
  before_action :authenticate_user!

  def create
    debugger
    @rate = current_user.rates.new(rates_create_params)
    if @rate.save
      head :created
    else
      head :bad_request
    end
    render
  end

  private

  def rates_create_params
    params.require(:rate).permit(:film_id, :rate)    
  end
end
