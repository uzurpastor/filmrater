class RatesController < ApplicationController
  before_action :authenticate_user!

  def create
    rate = current_user.rates.new(rates_create_params)
    @film = current_film
    if rate.save
      respond_to do |format| 
        format.html {redirect_to films_path}
        format.js
      end
    else
      respond_to do |format| 
        format.html {redirect_to films_path}
        format.js 
      end
    end
  end

  private

  def current_film
    Film.find(params[:rate][:film_id])
  end

  def rates_create_params
    params.require(:rate).permit(:film_id, :rate)    
  end
end
