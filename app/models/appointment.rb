class Appointment < ActiveRecord::Base
    belongs_to :team
    validates :datetime, :presence => true
end
