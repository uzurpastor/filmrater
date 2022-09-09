class RatesController < ApplicationController
  before_action :authenticate_user!
  before_action :init_options

  def create
    @rate = current_user.rates.new(rates_create_params)
    @options.merge!(film: current_film)
    @options.merge!(rate: AvarageRateCalc.call(@options[:film]))
    saved = @rate.save
    @options.merge!(rated?: current_user.rated?(@options[:film]))

    if saved
      respond_to do |format| 
        format.html {redirect_to film_path(@options[:film])}
        format.js
      end
    else
      respond_to do |format| 
        format.html {redirect_to film_path(@options[:film])}
        format.js   
      end
    end
  end

  private

  def init_options
    @options = {}  
  end

  def current_film
    Film.find(params[:rate][:film_id])
  end

  def rates_create_params
    params.require(:rate).permit(:film_id, :rate)    
  end
end
