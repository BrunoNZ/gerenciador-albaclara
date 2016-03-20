module SchedulesHelper

  # -------------------------------------------------------------------------- #
  def confirmation_status_options
    Schedule.get_valid_confirmation_status.map { |s| [s[:desc], s[:val]] }
  end

  def schedule_confirmation_status_btnclasses(schedule)
    if schedule.status.equal? 1
      return 'glyphicon glyphicon-ok btn btn-success disabled'
    else
      return 'glyphicon glyphicon-remove btn btn-danger disabled'
    end
  end
  # -------------------------------------------------------------------------- #

  # -------------------------------------------------------------------------- #
  def status_options
    Schedule.get_valid_status.map { |s| [s[:desc], s[:val]] }
  end
  # -------------------------------------------------------------------------- #

end
