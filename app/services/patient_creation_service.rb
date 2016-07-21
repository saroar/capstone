class PatientCreationService
    def initialize(patient)
        @patient = patient
    end
    
    def perform
        ActiveRecord::Base.transaction do
            @patient.save!
            @team = Team.create!(name: "#{@patient.name}'s Team", patient_id: @patient.id)
            @teammate = Teammate.create!(team_id: @team.id, user_id: @patient.creator_id)
        end
    end
end
  