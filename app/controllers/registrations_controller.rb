class RegistrationsController < Devise::RegistrationController
    def new
        invite = Invite.find_by(token: params[:token])
        super
        TeamMembership.create(team: invite.team, user: current_user)
    end
end