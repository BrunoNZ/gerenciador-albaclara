require 'csv'

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

  def self.to_csv
     attributes = %w{
       id name billing_date contract_start_date address
     }

     CSV.generate(headers: true) do |csv|
       csv << attributes

       all.each do |schedule|
         csv << attributes.map{ |attr| schedule.send(attr) }
       end
     end
   end
end
