class HomeController < ApplicationController
  # GET /courses or /courses.json
  def index
    @courses = Course.all
    @exams = Exam.all

    authorize @courses
    render :index
  end
end
