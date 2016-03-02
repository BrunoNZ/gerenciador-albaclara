class Client < ActiveRecord::Base

  has_many :contacts
  has_many :schedules
  has_many :productivities

  accepts_nested_attributes_for :contacts, :reject_if => :all_blank, :allow_destroy => true

  def find_active_schedules
    self.schedules.where("visit_datetime >= :time_now",time_now: Time.now)
  end
end
