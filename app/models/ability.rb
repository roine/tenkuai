class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    user ||= User.new # guest user (not logged in)
    user.roles.each do |c|
      if c.name == 'mod'
        can :read, :edit, :all
      elsif c.name == 'admin'
        can :manage, :all
      elsif c.name == 'user'
        can :read, [Category, Shir]
        can :manage, Shir, :user_id => user.id
        can :create, Shir
      end
    end
    can :read, :all
  end
end
