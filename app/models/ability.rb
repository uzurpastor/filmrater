# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Film
    return unless user.present?
    can :manage, Rate
    return unless user.admin?
    can :manage, Film
  end
end
