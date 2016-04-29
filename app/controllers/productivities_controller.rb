class ProductivitiesController < ApplicationController

  before_action :authenticate_user!
  before_action :load_client, except: [:empty_index]
  before_action :set_productivity, only: [:show, :edit, :update, :destroy]

  # GET /productivities
  def empty_index
    flash.now[:notice] = "Selecione um cliente"
    render 'index'
  end

  # GET /clients/1/productivities
  # GET /clients/1/productivities.json
  def index
    @productivities = @client.productivities.order(updated_at: :desc, created_at: :desc)
    respond_to do |format|
      format.html
      format.csv { send_data @productivities.to_csv }
    end
  end

  # GET /clients/1/productivities
  # GET /clients/1/productivities.json
  def show
  end

  # GET /clients/1/productivities/new
  def new
    @productivity = @client.productivities.new
  end

  # GET /clients/1/productivities/edit
  def edit
  end

  # POST /clients/1/productivities
  # POST /clients/1/productivities.json
  def create
    @productivity = @client.productivities.new(productivity_params)

    respond_to do |format|
      if @productivity.save
        format.html { redirect_to client_productivities_url(@client), notice: 'Productivity was successfully created.' }
        format.json { render :show, status: :created, location: @productivity }
      else
        format.html { render :new }
        format.json { render json: @productivity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clients/1/productivities/1
  # PATCH/PUT /clients/1/productivities/1.json
  def update
    respond_to do |format|
      if @productivity.update(productivity_params)
        format.html { redirect_to client_productivities_url(@client), notice: 'Productivity was successfully updated.' }
        format.json { render :show, status: :ok, location: @productivity }
      else
        format.html { render :edit }
        format.json { render json: @productivity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clients/1/productivities/1
  # DELETE /clients/1/productivities/1.json
  def destroy
    @productivity.destroy
    respond_to do |format|
      format.html { redirect_to client_productivities_url(@client), notice: 'Productivity was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def load_client
      @client = Client.find(params[:client_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_productivity
      @productivity = @client.productivities.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def productivity_params
      params.require(:productivity).permit(:analysis_start_date, :analysis_end_date, :call_qty, :answered_call_qty, :interlocutor_qty, :schedule_qty, :client_id)
    end
end
