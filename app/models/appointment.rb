class Appointment < ActiveRecord::Base
    belongs_to :team
    validates :datetime, :presence => true
    belongs_to :assigned_user, :class_name => 'User'
    belongs_to :suggested_user, :class_name => 'User'
end
