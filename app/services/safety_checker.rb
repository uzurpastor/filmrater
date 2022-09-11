class SafetyChecker
  def self.film_controller?(*args)
    self.new(*args).film_controller?
  end
  
  def self.rate_controller?(*args)
    self.new(*args).rate_controller?
  end
  
  def initialize(current_ability)
    @ability = current_ability
  end

  def film_controller?
    @ability.can? :manage, Film.new    
  end

  def rate_controller?
    @ability.can? :manage, Rate.new    
  end
end