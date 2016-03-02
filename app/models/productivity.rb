class Productivity < ActiveRecord::Base
  belongs_to :client

  validates :client, presence: true
end
