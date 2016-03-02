class ProductivitiesController < ApplicationController
  before_action :set_productivity, only: [:show, :edit, :update, :destroy]

  # GET /productivities
  # GET /productivities.json
  def index
    @productivities = Productivity.paginate(page: params[:page])
  end

  # GET /productivities/1
  # GET /productivities/1.json
  def show
  end

  # GET /productivities/new
  def new
    @productivity = Productivity.new
  end

  # GET /productivities/1/edit
  def edit
  end

  # POST /productivities
  # POST /productivities.json
  def create
    @productivity = Productivity.new(productivity_params)

    respond_to do |format|
      if @productivity.save
        format.html { redirect_to @productivity, notice: 'Productivity was successfully created.' }
        format.json { render :show, status: :created, location: @productivity }
      else
        format.html { render :new }
        format.json { render json: @productivity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /productivities/1
  # PATCH/PUT /productivities/1.json
  def update
    respond_to do |format|
      if @productivity.update(productivity_params)
        format.html { redirect_to @productivity, notice: 'Productivity was successfully updated.' }
        format.json { render :show, status: :ok, location: @productivity }
      else
        format.html { render :edit }
        format.json { render json: @productivity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /productivities/1
  # DELETE /productivities/1.json
  def destroy
    @productivity.destroy
    respond_to do |format|
      format.html { redirect_to productivities_url, notice: 'Productivity was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_productivity
      @productivity = Productivity.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def productivity_params
      params.require(:productivity).permit(:analysis_start_date, :analysis_end_date, :call_qty, :answered_call_qty, :interlocutor_qty, :schedule_qty, :client_id)
    end
end
