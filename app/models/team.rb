class Team < ActiveRecord::Base
    has_many :teammates, dependent: :destroy
    has_many :users, through: :teammates
    belongs_to :patient
    has_many :invites
    has_many :appointments, dependent: :destroy
end
