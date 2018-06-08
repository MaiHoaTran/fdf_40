class Ability
  include CanCan::Ability

  def initialize user
    user ||= User.new
    alias_action :user_order, to: :read
    if user.admin?
      can :manage, :all
    else
      can [:update, :read], User, id: user.id
      can :destroy, Order, status: Order.pending, user_id: user.id
      can :read, Order, user_id: user.id
      can :read, [Product, Comment, Category]
    end
  end
end
