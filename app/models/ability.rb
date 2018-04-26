class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
  
    case user
      when 0 #SUPER ADMIN ===========
        can :manage, :all
      when 1 #ADMIN ===========
        can :manage, [Article, Category, Home, User]
      when 2  #Periodista ===========
        can [:read, :edit, :create, :update, :like], [Article, User]
        can :read , Category
      when 3 #Lector ===========
        can [:show, :like], [Article, Category, Home, User]
      when nil #Visitante ======
        can :show, [Article, Category, Home, User] 
      end
    end
end
