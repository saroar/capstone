class RegistrationsController < Devise::RegistrationsController
    def new
        @invite = Invite.find_by(token: params[:invite_token])
        super
    end
    
    def create
        @invite = Invite.find_by(token: params[:user][:invite_token])
        super
        if @invite
            @user = User.find_by(email: params[:user][:email])
            TeamMembership.create(team: @invite.team, user: @user)
        end
    end
end