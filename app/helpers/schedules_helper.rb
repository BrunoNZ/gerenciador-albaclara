module SchedulesHelper
  def status_options
    (0..2).map { |s| [status_name?(s), s] }
  end

  def schedule_status_btnclasses(schedule)
    if schedule.status.equal? 1
      return 'glyphicon glyphicon-ok btn btn-success disabled'
    else
      return 'glyphicon glyphicon-remove btn btn-danger disabled'
    end
  end

  def status_name(schedule)
    return status_name?(schedule.status)
  end

  def status_name?(status)
    case status
      when 0
        return ''
      when 1
        return 'Confirmado'
      when 2
        return 'Desconfirmado'
      else
        return 'ERRO'
    end
  end

end
