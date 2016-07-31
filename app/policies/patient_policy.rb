class PatientPolicy < ApplicationPolicy
    alias_method :patient, :record
    
    def new?
        user.present?
    end
    
    def create?
        new?
    end
    
    def show?
        patient.users.include?(user)
    end
    
    def edit?
        show?
    end
    
    def update?
        show?
    end
    
    def destroy?
        patient.account == user
    end
    
    class Scope < Scope
        def resolve
            scope.joins(:users).where(users: {id: user.id})
        end
    end
end
