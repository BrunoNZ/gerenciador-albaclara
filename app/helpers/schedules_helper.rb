module SchedulesHelper
  def status_options
    (0..2).map { |s| [status_name(s), s] }
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
