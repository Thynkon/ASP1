class ExamsController < ApplicationController
  before_action :set_exam, only: %i[ show edit update destroy ]

  # GET /exams or /exams.json
  def index
    @exams = current_user.exams

    authorize @exams
  end

  # GET /exams/1 or /exams/1.json
  def show
    authorize @exam
  end

  # GET /exams/new
  def new
    @exam = Exam.new
    @exam.course = Course.find(params[:course_id])

    authorize @exam
  end

  # GET /exams/1/edit
  def edit
    authorize @exam
  end

  # POST /exams or /exams.json
  def create
    @exam = Exam.new(exam_params)
    @exam.course = Course.find(params[:course_id])
    @exam.teacher = current_user

    authorize @exam

    respond_to do |format|
      if @exam.save
        format.html { redirect_to exam_url(@exam), notice: "Exam was successfully created." }
        format.json { render :show, status: :created, location: @exam }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @exam.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /exams/1 or /exams/1.json
  def update
    authorize @exam

    respond_to do |format|
      if @exam.update(exam_params)
        format.html { redirect_to exam_url(@exam), notice: "Exam was successfully updated." }
        format.json { render :show, status: :ok, location: @exam }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @exam.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /exams/1 or /exams/1.json
  def destroy
    @course = @exam.course
    authorize @exam
    @exam.destroy

    respond_to do |format|
      format.html { redirect_to course_path(@course), notice: "Exam was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exam
      @exam = Exam.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def exam_params
      params.require(:exam).permit(:name, :weight, :passed_at, :course_id)
    end
end
