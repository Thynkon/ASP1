class ExamPolicy < ApplicationPolicy
    attr_reader :user, :exam
  
    def initialize(user, exam)
      @user = user
      @exam = exam
    end
  
    def index?
      user.teacher? || user.student?
    end

    def new?
      user.teacher?
    end

    def create?
      user.teacher?
    end

    def show?
      user.teacher? || user.student?
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