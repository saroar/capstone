class Team < ActiveRecord::Base
    has_many :team_memberships, dependent: :destroy
    has_many :users, through: :team_memberships
    belongs_to :patient
    has_many :invites
    has_many :appointments, dependent: :destroy
end
