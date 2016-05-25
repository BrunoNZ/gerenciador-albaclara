class Ability
  include CanCan::Ability

  # Based on:
  # - https://github.com/CanCanCommunity/cancancan/wiki
  # - https://github.com/CanCanCommunity/cancancan/wiki/Non-RESTful-Controllers
  def initialize(user)

    alias_action :create, :read, :update, :destroy, :to => :crud

    user ||= User.new # guest user (not logged in)

    case user.role

    when 'admin'
      can :crud, :all
      can :view, :hellobi

    when 'supervisor'
      can :crud, :all
      can :view, :hellobi
      cannot :crud, Supervisor
      cannot :crud, User
      cannot :create, Document
      cannot :update, Document
      cannot :destroy, Document

    when 'user'
      can :crud, :all
      can :view, :hellobi
      cannot :crud, Supervisor
      cannot :crud, User
      cannot :create, Document
      cannot :update, Document
      cannot :destroy, Document

    else
      cannot :crud, :all
      cannot :view, :hellobi

    end

    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
