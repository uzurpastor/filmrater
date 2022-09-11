class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token
  before_action :current_ability

  def current_ability
    @current_ability ||= Ability.new(current_user)
  end

  def safety_film_controller?
    SafetyChecker.film_controller?(current_ability)
  end

  def safety_rate_controller?
    SafetyChecker.rate_controller?(current_ability)
  end
end
