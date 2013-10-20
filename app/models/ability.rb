class Ability
  include CanCan::Ability

  attr_accessor :user

  def initialize(user)
    alias_action :show, :update, :index, :to => :change
    @user = user || User.new

    determine_ability
  end


  private


  def determine_ability
    if user.has_role? :admin
      can :manage, :all
    elsif user.has_role? :user
       user_rights
    end
    visitor_rights
  end


  def user_rights
    can [:show, :update], User, :id => user.id
    can [:read, :create], Post 
    can :read, Provider 
    can :read, Author 
    can :read, Type
  end

  def visitor_rights

  end



  # def initialize(user)
  #   user ||= User.new # guest user (not logged in)
  #   if user.has_role? :admin
  #     can :manage, :all
  #   end
  #   # Define abilities for the passed in user here. For example:
  #   #
  #     # user ||= User.new # guest user (not logged in)
  #     # if user.admin?
  #     #   can :manage, :all
  #     # else
  #     #   can :read, :all
  #     # end
  #   #
  #   # The first argument to `can` is the action you are giving the user permission to do.
  #   # If you pass :manage it will apply to every action. Other common actions here are
  #   # :read, :create, :update and :destroy.
  #   #
  #   # The second argument is the resource the user can perform the action on. If you pass
  #   # :all it will apply to every resource. Otherwise pass a Ruby class of the resource.
  #   #
  #   # The third argument is an optional hash of conditions to further filter the objects.
  #   # For example, here the user can only update published articles.
  #   #
  #   #   can :update, Article, :published => true
  #   #
  #   # See the wiki for details: https://github.com/ryanb/cancan/wiki/Defining-Abilities
  # end
end
