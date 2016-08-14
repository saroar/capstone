class TeamMembershipsController < ApplicationController
    def index
        @teammemberships = TeamMembership.all
    end
end
