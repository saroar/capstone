class Team < ActiveRecord::Base
    has_many :teammates, dependent: :destroy
    has_many :caretakers, through: :teammates, source: :user
    belongs_to :patient
    has_many :invites
    after_create :add_teammate
    
    private
    
    def add_teammate
        @teammate = Teammate.create(user_id: self.patient.creator_id, team_id: self.id)
    end
end
