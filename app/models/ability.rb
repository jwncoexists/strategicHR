class Ability
  include CanCan::Ability

  def initialize(user)
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
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
    user ||= User.new # guest user (not logged in)
    if user.account? :admin
      can :manage, :all
    elsif user.account? :member
      can :take, Course, released: true
      can :view_certificate, Course do |course|
        course.my_status(user) == "Certificate Purchased"
      end
      can :purchase_certificate, Course do |course|
        course.certificate.where(user_id: user.id).empty? &&
        course.my_status(user) =~ /Quiz(zes)? Completed/
      end
    end
  end
end
