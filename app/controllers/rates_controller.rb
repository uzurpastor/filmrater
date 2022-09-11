class RatesController < ApplicationController
  before_action :authenticate_user!

  def create
    return unless safety_rate_controller?

    @rate = current_user.rates.new(RatesParamsPermitter.create(params))
    @rate.save

    @options = OptionSetter.new(current_film, current_user)
                           .options(%i[rate_params film])
    respond_to do |format| 
      format.html {redirect_to film_path(@options[:film])}
      format.js
    end
  end

  private

  def current_film
    FilmSetter.certain(params)
  end
end
