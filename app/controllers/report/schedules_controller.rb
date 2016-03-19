class Report::SchedulesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_report_schedule, only: [:show]

  # GET /report/schedules
  def index
    @clients = Client.all
    @dates = Array.new

    # @schedules_per_client[][] = Array.new
    @schedules_per_client = Hash.new{|hash, key|
      hash[key] = Hash.new{|hash, key|
        hash[key] = Array.new
      }
    }
    Schedule.find_each do |s|
      @schedules_per_client[s.client_id][s.get_visit_date] << s
      @dates << s.get_visit_date
    end

    @dates.uniq!.sort!.take(12)

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
