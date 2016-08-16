class Appointment < ActiveRecord::Base
    belongs_to :team
    validates :datetime, :presence => true
    belongs_to :user
end
