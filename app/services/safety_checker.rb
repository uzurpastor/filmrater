class SafetyChecker
  def self.safety?(*args)
    self.new(*args).safety?
  end
  
  def initialize(current_ability)
    @ability = current_ability
  end

  def safety?
    @ability.can? :manage, Film.new    
  end
end