class EvaluationsController < ApplicationController
  before_action :set_evaluation, only: %i[ show edit update destroy ]

  # GET /evaluations or /evaluations.json
  def index
    if current_user.student?
      @evaluations = current_user.evaluations
    else
      @evaluations = Evaluation.all
    end

    authorize @evaluations
  end

  # GET /evaluations/1 or /evaluations/1.json
  def show
  end

  # GET /evaluations/new
  def new
    @evaluation = Evaluation.new
    authorize @evaluation
  end

  # GET /evaluations/1/edit
  def edit
  end

  # POST /evaluations or /evaluations.json
  def create
    @evaluation = Evaluation.new(evaluation_params)
    authorize @evaluation

    respond_to do |format|
      if @evaluation.save
        format.html { redirect_to evaluation_url(@evaluation), notice: "Evaluation was successfully created." }
        format.json { render :show, status: :created, location: @evaluation }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @evaluation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /evaluations/1 or /evaluations/1.json
  def update
    authorize @evaluation

    respond_to do |format|
      if @evaluation.update(evaluation_params)
        format.html { redirect_to evaluation_url(@evaluation), notice: "Evaluation was successfully updated." }
        format.json { render :show, status: :ok, location: @evaluation }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @evaluation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /evaluations/1 or /evaluations/1.json
  def destroy
    authorize @evaluation
    @evaluation.destroy

    respond_to do |format|
      format.html { redirect_to evaluations_url, notice: "Evaluation was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_evaluation
      @evaluation = Evaluation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def evaluation_params
      params.require(:evaluation).permit(:grade)
    end
end
