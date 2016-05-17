class SchedulesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_schedule, only: [:show, :edit, :update, :destroy]

  # GET /schedules
  # GET /schedules.json
  def index

    if params.include? "client" then
      @schedules = Schedule.where(client: params["client"]).includes(:client)
      puts "COM_CLIENTE"
    else
      @schedules = Schedule.all.includes(:client)
      puts "SEM_CLIENTE"
    end

    respond_to do |format|
      format.html { @schedules.order!(updated_at: :desc, created_at: :desc) }
      format.csv { send_data @schedules.to_csv }
    end
  end

  # GET /schedules/1
  # GET /schedules/1.json
  def show
  end

  # GET /schedules/new
  def new
    @schedule = Schedule.new
  end

  # GET /schedules/1/edit
  def edit
  end

  # POST /schedules
  # POST /schedules.json
  def create
    @schedule = Schedule.new(schedule_params)

    respond_to do |format|
      if @schedule.save
        format.html {
          redirect_to schedules_path,
            notice: 'O agendamento foi criado com sucesso.'
        }
        format.json { render :show, status: :created, location: @schedule }

        if (@schedule.visit_datetime > Time.now)
          ClientMailer.new_schedule(@schedule).deliver_later
        end

      else
        format.html { render :new }
        format.json { render json: @schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clients/1/schedules/1
  # PATCH/PUT /clients/1/schedules/1.json
  def update
    status_changed = detect_confirmation_status_changed(@schedule, schedule_params)
    respond_to do |format|
      if @schedule.update(schedule_params)
        format.html {
          redirect_to schedules_path,
            notice: 'O agendamento foi alterado com sucesso.'
        }
        format.json { render :show, status: :ok, location: @schedule }

        if ((@schedule.visit_datetime > Time.now) && status_changed)
          ClientMailer.update_schedule_confirmation_status(@schedule).deliver_later
        end

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
      format.html {
        redirect_to schedules_path,
          notice: 'O agendamento foi removido com sucesso.'
      }
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
      return false if schedule.confirmation_status.eql? params["confirmation_status"].to_i
      return true
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_schedule
      @schedule = Schedule.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def schedule_params
      params.require(:schedule).permit(:name, :contact_name, :contact_phone, :contact_date, :visit_datetime, :address, :observation, :status, :confirmation_status, :client_id)
    end
end
