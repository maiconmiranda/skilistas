# frozen_string_literal: true

# class Ability
#   include CanCan::Ability

#   def initialize(user)
#     can :read, Profile, public: true
    
#     if user.admin?
#       can :manage, :all
#     if user.present?
#       can :manage, Profile
#       can :manage, Account, user_id: user.id
#     end
#     end
#   end
# end
