class HomeController < ApplicationController
  # GET /courses or /courses.json
  def index
    if current_user.teacher?
      @courses = current_user.courses
      puts "Index home controller"
      render 'courses/index'
    else
      @evaluations = current_user.evaluations
      render 'evaluations/index'
    end
  end
end
