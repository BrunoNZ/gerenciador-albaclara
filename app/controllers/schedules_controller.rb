class SchedulesController < ApplicationController

  before_action :authenticate_user!
  before_action :load_client, except: [:empty_index]
  before_action :set_schedule, only: [:show, :edit, :update, :destroy]

  # GET /schedules
  def empty_index
    flash.now[:notice] = "Selecione um cliente"
    render 'index'
  end

  # GET /clients/1/schedules
  # GET /clients/1/schedules.json
  def index
    @schedules = @client.schedules
    respond_to do |format|
      format.html
      format.csv { send_data @schedules.to_csv }
    end
  end

  # GET /clients/1/schedules/1
  # GET /clients/1/schedules/1.json
  def show
  end

  # GET /clients/1/schedules/new
  def new
    @schedule = @client.schedules.new
  end

  # GET /clients/1/schedules/1/edit
  def edit
  end

  # POST /clients/1/schedules
  # POST /clients/1/schedules.json
  def create
    @schedule = @client.schedules.new(schedule_params)

    respond_to do |format|
      if @schedule.save
        format.html { redirect_to [@client,@schedule], notice: 'O agendamento foi criado com sucesso.' }
        format.json { render :show, status: :created, location: @schedule }
        ClientMailer.new_schedule(@schedule).deliver_later
      else
        format.html { render :new }
        format.json { render json: @schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clients/1/schedules/1
  # PATCH/PUT /clients/1/schedules/1.json
  def update
    status_changed =  detect_status_changed(@schedule, schedule_params) ||
                        detect_confirmation_status_changed(@schedule, schedule_params)
    respond_to do |format|
      if @schedule.update(schedule_params)
        format.html { redirect_to [@client,@schedule], notice: 'O agendamento foi alterado com sucesso.' }
        format.json { render :show, status: :ok, location: @schedule }
        ClientMailer.update_schedule_status(@schedule).deliver_later if status_changed
      else
        format.html { render :edit }
        format.json { render json: @schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clients/1/schedules/1
  # DELETE /clients/1/schedules/1.json
  def destroy
    @schedule.destroy
    respond_to do |format|
      format.html { redirect_to client_schedules_path(@client), notice: 'O agendamento foi removido com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    def detect_status_changed(schedule,params)
      return false if !params.include? "status"
      return false if schedule.status.equal? params["status"]
      return true
    end

    def detect_confirmation_status_changed(schedule,params)
      return false if !params.include? "confirmation_status"
      return false if schedule.confirmation_status.equal? params["confirmation_status"]
      return true
    end

    def load_client
      @client = Client.find(params[:client_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_schedule
      @schedule = @client.schedules.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def schedule_params
      params.require(:schedule).permit(:name, :contact_name, :contact_phone, :contact_date, :visit_datetime, :address, :observation, :status, :confirmation_status, :client_id)
    end
end
