class Team < ActiveRecord::Base
    has_many :teams_users, dependent: :destroy
    has_many :caretakers, through: :teams_users
end
