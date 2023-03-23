class EvaluationPolicy < ApplicationPolicy
    attr_reader :user, :evaluation
  
    def initialize(user, evaluation)
      @user = user
      @evaluation = evaluation
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
      user.teacher? || evalation.student == user
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