module SchedulesHelper

  # -------------------------------------------------------------------------- #
  def confirmation_status_options
    (0..2).map { |s| [confirmation_status_name?(s), s] }
  end

  def confirmation_status_name(schedule)
    return confirmation_status_name?(schedule.confirmation_status)
  end

  def confirmation_status_name?(confirmation_status)
    case confirmation_status
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
  # -------------------------------------------------------------------------- #

  # -------------------------------------------------------------------------- #
  def status_options
    (0..5).map { |s| [status_name?(s), s] }
  end

  def status_name(schedule)
    return status_name?(schedule.status)
  end

  def status_name?(status)
    case status
      when 0
        return ''
      when 1
        return 'A ser realizado'
      when 2
        return 'Desmarcado'
      when 3
        return 'Fora do target'
      when 4
        return 'Dentro do target'
      when 5
        return 'Potencial de fechamento'
      else
        return 'ERRO'
    end
  end
  # -------------------------------------------------------------------------- #

end
