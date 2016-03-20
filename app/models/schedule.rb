class Schedule < ActiveRecord::Base
  belongs_to :client

  validates_inclusion_of :status, :in => 0..5
  validates_inclusion_of :confirmation_status, :in => 0..2

  after_initialize :init

  def get_visit_date
    return self.visit_datetime.strftime("%Y%m").to_i
  end

  def get_status_desc
    return Schedule.get_valid_status[self.status][:desc]
  end

  def get_status_desc
    return Schedule.get_valid_confirmation_status[self.confirmation_status][:desc]
  end

  def self.get_valid_status
    @valid_status ||= [
      {val: 1, desc: 'A ser realizado'},
      {val: 2, desc: 'Visita desmarcada'},
      {val: 3, desc: 'Visita fora do target'},
      {val: 4, desc: 'Visita dentro do target'},
      {val: 5, desc: 'Visita com potencial de fechamento'}
    ]
  end

  def self.get_valid_confirmation_status
    @valid_confirmation_status ||= [
      {val: 1, desc: 'Confirmado'},
      {val: 2, desc: 'Desconfirmado'}
    ]
  end

  private

  def init
    self.status = 0 if self.status.nil?
    self.confirmation_status = 0 if self.confirmation_status.nil?
  end

end
