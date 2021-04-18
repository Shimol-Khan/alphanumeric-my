class Ability
  include CanCan::Ability

  def initialize(user)  
    user ||= User.new
    if user.admin?
        can :manage, :all
    else
        # Card Management
        can :create, Card
        can :read, Card
        can :update, Card, user_id: user.id
        can :destroy, Card, user_id: user.id

        # Question Management
        can :create, Question
        can :read, Question
        can :update, Question, user_id: user.id
        can :destroy, Question, user_id: user.id

        # Answer
        # Nobody can answer except Admin

    end
  end
end