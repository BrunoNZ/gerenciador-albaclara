class Schedule < ActiveRecord::Base
  belongs_to :client

  validates :client, presence: true
  validates_inclusion_of :status, :in => 0..5
  validates_inclusion_of :confirmation_status, :in => 0..2

  def get_visit_date
    return self.visit_datetime.strftime("%Y%m").to_i
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

end
