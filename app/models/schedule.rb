class Schedule < ActiveRecord::Base
  belongs_to :client

  validates :client, presence: true
  validates_inclusion_of :status, :in => 0..2

end
