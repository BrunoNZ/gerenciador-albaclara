class ProductivitiesController < ApplicationController

  before_action :authenticate_user!
  load_and_authorize_resource

  before_action :set_productivity, only: [:show, :edit, :update, :destroy]

  # GET /productivities
  def index
    if params.include? "client" then
      @productivities = Productivity.where(client: params["client"]).includes(:client)
    else
      @productivities = Productivity.all.includes(:client)
    end

    respond_to do |format|
      format.html { @productivities.order!(updated_at: :desc, created_at: :desc) }
      format.csv { send_data @productivities.to_csv }
    end
  end

  # GET /productivities
  # GET /productivities.json
  def show
  end

  # GET /productivities/new
  def new
    @productivity = Productivity.new
  end

  # GET /productivities/edit
  def edit
  end

  # POST /productivities
  # POST /productivities.json
  def create
    @productivity = Productivity.new(productivity_params)

    respond_to do |format|
      if @productivity.save
        format.html { redirect_to productivities_path, notice: 'A produtividade foi criada com sucesso.' }
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
        format.html { redirect_to productivities_path, notice: 'A produtividade foi alterada com sucesso.' }
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
      format.html { redirect_to productivities_path, notice: 'A produtividade foi removida com sucesso.' }
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
