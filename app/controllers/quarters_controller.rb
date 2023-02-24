class QuartersController < ApplicationController
  before_action :set_quarter, only: %i[ show edit update destroy ]

  # GET /quarters or /quarters.json
  def index
    @quarters = Quarter.all
  end

  # GET /quarters/1 or /quarters/1.json
  def show
  end

  # GET /quarters/new
  def new
    @quarter = Quarter.new
  end

  # GET /quarters/1/edit
  def edit
  end

  # POST /quarters or /quarters.json
  def create
    @quarter = Quarter.new(quarter_params)

    respond_to do |format|
      if @quarter.save
        format.html { redirect_to quarter_url(@quarter), notice: "Quarter was successfully created." }
        format.json { render :show, status: :created, location: @quarter }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @quarter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /quarters/1 or /quarters/1.json
  def update
    respond_to do |format|
      if @quarter.update(quarter_params)
        format.html { redirect_to quarter_url(@quarter), notice: "Quarter was successfully updated." }
        format.json { render :show, status: :ok, location: @quarter }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @quarter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quarters/1 or /quarters/1.json
  def destroy
    @quarter.destroy

    respond_to do |format|
      format.html { redirect_to quarters_url, notice: "Quarter was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quarter
      @quarter = Quarter.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def quarter_params
      params.require(:quarter).permit(:started_at, :ended_at)
    end
end
