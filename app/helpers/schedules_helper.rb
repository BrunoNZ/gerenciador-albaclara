module SchedulesHelper

  # -------------------------------------------------------------------------- #
  def confirmation_status_options
    Schedule.get_valid_confirmation_status.map{ |status,desc| [desc,status] }
  end

  def schedule_confirmation_status_btnclasses(schedule)
    if schedule.confirmation_status.equal? 1
      return 'glyphicon glyphicon-ok btn btn-success disabled'
    else
      return 'glyphicon glyphicon-remove btn btn-danger disabled'
    end
  end
  # -------------------------------------------------------------------------- #

  # -------------------------------------------------------------------------- #
  def status_options
    Schedule.get_valid_status.map { |status,desc| [desc, status] }
  end
  # -------------------------------------------------------------------------- #

  def status_update_confirmation_message(old_status,new_status)
    message = ""
    message << "Tem certeza que deseja alterar o status?\n"
    message << "\n"
    message << "* De: #{old_status}\n"
    message << "\n"
    message << "* Para: #{new_status}"
    message
  end

end
