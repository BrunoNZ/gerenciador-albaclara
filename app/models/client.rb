class Client < ActiveRecord::Base

  has_many :contacts
  has_many :schedules
  has_many :productivities

  accepts_nested_attributes_for :contacts, :reject_if => :all_blank, :allow_destroy => true

  def find_active_schedules
    return self.schedules.where("visit_datetime >= :time_now",time_now: Time.now)
  end

  def find_last_productivity
    return self.productivities.order("created_at").last
  end
end
