class HomeController < ApplicationController
  # GET /courses or /courses.json
  def index
    @courses = Course.all
    @exams = Exam.all

    render :index
  end
end
