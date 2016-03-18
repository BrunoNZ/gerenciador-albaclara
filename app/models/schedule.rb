class Schedule < ActiveRecord::Base
  belongs_to :client

  validates :client, presence: true
  validates_inclusion_of :status, :in => 0..5
  validates_inclusion_of :confirmation_status, :in => 0..2

end
