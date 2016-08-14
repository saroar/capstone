class Patient < ActiveRecord::Base
    has_one :team
    has_many :team_memberships, through: :team
    has_many :users, through: :team_memberships
    belongs_to :account, class_name: "User", foreign_key: "user_id"
end