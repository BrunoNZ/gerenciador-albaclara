require 'csv'

class Productivity < ActiveRecord::Base
  belongs_to :client
  validates_associated :client

  validates :analysis_start_date, presence: true
  validates :analysis_end_date, presence: true

  validates :call_qty,
    presence: true,
    numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  validates :answered_call_qty,
    presence: true,
    numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  validates :interlocutor_qty,
    presence: true,
    numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  validates :schedule_qty,
    presence: true,
    numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def self.to_csv
    attributes = %w{
      id client_id analysis_start_date analysis_end_date
      call_qty answered_call_qty interlocutor_qty schedule_qty
    }

    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |productivity|
        csv << attributes.map{ |attr| productivity.send(attr) }
      end
    end
  end
end
