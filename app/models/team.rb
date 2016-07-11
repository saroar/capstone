class Team < ActiveRecord::Base
    has_many :teammates, dependent: :destroy
    has_many :caretakers, through: :teammates, source: :user
    belongs_to :patient
    has_many :invites
end
