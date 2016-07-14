class Patient < ActiveRecord::Base
    has_one :team
    belongs_to :user
    after_create :build_team
    
    private
    
    def build_team
        @team = Team.create(name: "#{self.name}'s Team", patient_id: self.id)
    end

end