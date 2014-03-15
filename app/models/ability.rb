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
    # user ||= User.new # guest user (not logged in)
    if user
      if user.account? :admin
        can :view_certificate, Course do |course|
          !Certificate.where(user_id: user.id, course_id: course.id).empty?
        end
        can :purchase_certificate, Course do |course|
          Certificate.where(user_id: user.id, course_id: course.id).empty? &&
          course.my_status(user) =~ /Quiz(zes)? Complete/
        end
        can :view_handout, Course do |course|
          !course.handout.file.nil?
        end
        can :create, Course
        can :update, Course
        can :destroy, Course
        can :take, Course
        can :manage, Quiz
        can :manage, Section
        can :manage, Video
        can :manage, User
        can :view_pricing, User
      elsif user.account? :member
        can :take, Course, released: true
        can :view, Video 
        can :see_course_video_button, Course do |course|
          course.released && course.next_incomplete_section(user)
        end
        can :see_course_quiz_button, Course do |course|
          course.released && 
          course.next_incomplete_section(user) &&
          !course.next_incomplete_section(user).quiz_id.nil?
        end
        can :view_account, User do |acctuser|
          user.account == "member" && acctuser.id == user.id
        end
        can :edit_account, User do |acctuser|
          user.account == "member" && acctuser.id == user.id
        end
        can :view_handout, Course do |course|
          course.released && !course.handout.file.nil?
        end
        can :view_certificate, Course do |course|
          course.my_status(user) == "Course Completed! Certificate Purchased."
        end
        can :purchase_certificate, Course do |course|
          Certificate.where(user_id: user.id, course_id: course.id).empty? &&
          course.my_status(user) =~ /Quiz(zes)? Complete/
        end
      end
      
    # users who are not logged in can view courses  
    else
      can :view, Course
      can :view_pricing, User
    end
  end
end
