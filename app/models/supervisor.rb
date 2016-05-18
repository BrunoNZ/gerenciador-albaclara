class Supervisor < ActiveRecord::Base
  validates :email, presence: true
end
