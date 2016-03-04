module SchedulesHelper
  def status_options
    (0..2).map { |s| [status_name(s), s] }
  end

  def schedule_status_btnclasses(schedule)
    if schedule.status.equal? 1
      return 'glyphicon glyphicon-ok btn btn-success disabled'
    else
      return 'glyphicon glyphicon-remove btn btn-danger disabled'
    end
  end

  private

  def status_name(status)
    case status
      when 0
        ''
      when 1
        'Confirmado'
      when 2
        'Desconfirmado'
      else
        'ERRO'
    end
  end
end
