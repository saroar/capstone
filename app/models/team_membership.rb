class TeamMembership < ActiveRecord::Base
 belongs_to :team
 belongs_to :user
 validates :team, presence: true
 validates :user, presence: true
 validates :user, uniqueness: { scope: :team }
end
