class TeamPolicy < ApplicationPolicy
    alias_method :team, :record
    
    def new?
        user.present?
    end
    
    def create?
        new?
    end
    
    def show?
        team.users.include?(user)
    end
    
    def edit?
        show?
    end
    
    def update?
        show?
    end
    
    def destroy?
        team.user == user || user.admin?
    end
    
    class Scope < Scope
        def resolve
            scope.joins(:users).where(users: {id: user.id})
            #patient_policy scope.joins(users: {id: user.id})
        end
    end
end

