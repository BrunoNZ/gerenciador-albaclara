class Report::SchedulesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_report_schedule, only: [:show]

  # GET /report/schedules
  # GET /report/schedules.json
  def index
    @clients = Client.all

    schedules = Schedule.all
    @schedules = schedules.group_by {|s| s.visit_datetime.strftime("%Y%m")}
    @months = schedules.map{|s| s.visit_datetime.strftime("%Y%m")}.uniq!.sort!.take(12)

  end

  # GET /report/schedules/1
  # GET /report/schedules/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_report_schedule
      @schedule = Schedule.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def report_schedule_params
      params.fetch(:report_schedule, {})
    end
end
