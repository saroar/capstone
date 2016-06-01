class TeamPolicy < ApplicationPolicy
    alias_method :team, :record
    
    def new?
        user.present?
    end
    
    def new?
        create?
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
            teams = []
                if user && user.admin?
                    teams = scope.all
                else
                    teams.each do |team|
                        teams << team if team.users.include?(user)
                    end
                end
            teams
        end
    end
        
end