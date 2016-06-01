class Team < ActiveRecord::Base
    has_many :patientcaretakers, dependent: :destroy
    has_many :caretakers, through: :patientcaretakers
end
