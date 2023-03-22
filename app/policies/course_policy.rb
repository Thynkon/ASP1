class CoursePolicy < ApplicationPolicy
    attr_reader :user, :course
  
    def initialize(user, post)
      @user = user
      @post = post
    end
  
    def index?
      user.teacher?
    end

    def new?
      user.teacher?
    end

    def create?
      user.teacher?
    end

    def show?
      user.teacher?
    end

    def edit?
      user.teacher?
    end

    def update?
      user.teacher?
    end

    def destroy?
      user.teacher?
    end
  end