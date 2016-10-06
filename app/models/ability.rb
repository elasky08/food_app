class Ability
  include CanCan::Ability

  def initialize(user)
      user ||= User.new
      if user.admin?
        can :manage, :all
      else
        can :read, :all
      end

      can :manage, User do |user|
        user == session.user
      end

      can :manage, MenuItem do |menu|
        user == menu.user
      end

      can :like, Review do |review|
        user != review.user
      end

      cannot :like, Review do |review|
        user == review.user
      end

      can :destroy, Like do |like|
        user == like.user
      end

  end
end
