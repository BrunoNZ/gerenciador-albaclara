require 'csv'

class Productivity < ActiveRecord::Base
  belongs_to :client

  validates :client, presence: true

  def self.to_csv
    attributes = %w{
      id client_id analysis_start_date analysis_end_date call_qty
      answered_call_qty interlocutor_qty schedule_qty
    }

    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |productivity|
        csv << attributes.map{ |attr| productivity.send(attr) }
      end
    end
  end
end
