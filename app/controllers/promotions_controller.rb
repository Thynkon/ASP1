class PromotionsController < ApplicationController
  before_action :set_promotion, only: %i[ show edit update destroy ]

  # GET /promotions or /promotions.json
  def index
    if current_user.teacher?
      @promotions = Promotion.all
    else
      @promotions = current_user.promotions
    end
  end

  # GET /promotions/1 or /promotions/1.json
  def show
  end

  # GET /promotions/new
  def new
    @promotion = Promotion.new
  end

  # GET /promotions/1/edit
  def edit
  end

  # POST /promotions or /promotions.json
  def create
    @promotion = Promotion.new(name: promotion_params[:name], started_at: promotion_params[:started_at], ended_at: promotion_params[:ended_at])
    @students = promotion_params['students'].map { |id| Student.find(id) }
    @promotion.students = @students

    respond_to do |format|
      if @promotion.save
        format.html { redirect_to promotion_url(@promotion), notice: "Promotion was successfully created." }
        format.json { render :show, status: :created, location: @promotion }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @promotion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /promotions/1 or /promotions/1.json
  def update
    respond_to do |format|
      if @promotion.update(promotion_params)
        format.html { redirect_to promotion_url(@promotion), notice: "Promotion was successfully updated." }
        format.json { render :show, status: :ok, location: @promotion }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @promotion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /promotions/1 or /promotions/1.json
  def destroy
    @promotion.destroy

    respond_to do |format|
      format.html { redirect_to promotions_url, notice: "Promotion was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_promotion
      @promotion = Promotion.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def promotion_params
      params.require(:promotion).permit(:name, :started_at, :ended_at, :students => [])
    end
end
