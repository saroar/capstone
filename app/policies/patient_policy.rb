class PatientPolicy < ApplicationPolicy
    alias_method :patient, :record
    
    def new?
        user.present?
    end
    
    def new?
        create?
    end
    
    def show?
        patient.caretakers.include?(user)
    end
    
    def edit?
        show?
    end
    
    def update?
        show?
    end
    
    def destroy?
        patient.caretaker == user || user.admin?
    end
    
    class Scope < Scope
        patients = []
        if user.admin?
            patients = scope.all
        else
            patients.each do |patient|
                patients << patient if patient.caretakers.include?(user)
            end
        end
        patients
    end
        
end