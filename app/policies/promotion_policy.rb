class PromotionPolicy < ApplicationPolicy
    attr_reader :user, :promotion
  
    def initialize(user, promotion)
      @user = user
      @promotion = promotion
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
      user.teacher? || promotion.students.include?(user)
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