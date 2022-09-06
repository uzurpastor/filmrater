class RatesController < ApplicationController
  before_action :authenticate_user!

  def create
    rate = current_user.rates.new(rates_create_params)
    if rate.save
      # temporary 
      redirect_to films_path
    else
      redirect_to films_path
    end
  end

  private

  def rates_create_params
    params.require(:rate).permit(:film_id, :rate)    
  end
end
