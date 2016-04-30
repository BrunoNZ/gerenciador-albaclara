require 'csv'

class Schedule < ActiveRecord::Base
  belongs_to :client
  validates_associated :client

  validates :name, presence: true
  validates :visit_datetime, presence: true

  after_initialize :init

  def get_visit_date
    return self.visit_datetime.strftime("%Y%m").to_i
  end

  def get_visit_complete_date
    return self.visit_datetime.strftime("%d/%m/%Y %H:%M")
  end

  def get_status_desc
    return Schedule.get_valid_status[self.status]
  end

  def get_confirmation_status_desc
    return Schedule.get_valid_confirmation_status[self.confirmation_status]
  end

  def self.get_valid_status
    @valid_status ||= Hash[
      1 => 'A ser realizado',
      2 => 'Visita desmarcada',
      3 => 'Visita fora do target',
      4 => 'Visita dentro do target',
      5 => 'Visita com potencial de fechamento'
    ]
  end

  def self.get_valid_confirmation_status
    @valid_confirmation_status ||= Hash[
      1 => 'Confirmado',
      2 => 'Desconfirmado'
    ]
  end

  def self.to_csv
    attributes = %w{
      id client_id name contact_phone contact_name
      contact_date visit_datetime address
      observation status confirmation_status
    }

    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |schedule|
        csv << attributes.map{ |attr| schedule.send(attr) }
      end
    end
  end

  private

  def init
    self.status = 0 if self.status.nil?
    self.confirmation_status = 0 if self.confirmation_status.nil?
  end

end
