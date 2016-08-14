class InvitesController < ApplicationController
    def new
        @invite = Invite.new
    end
    
    def create
        @invite = Invite.new(invite_params)
        @invite.sender_id = current_user.id
        if @invite.save 
        #if the user already exists
            if @invite.recipient != nil
                @user = @invite.recipient
                InviteMailer.existing_user_invite(@invite).deliver
                @team_membership = TeamMembership.create(team: @invite.team, user: @user)
                if @team_membership.save
                    flash[:notice] = "#{@user.name} was added to #{@invite.team.name}.  A notifcation email has been sent."
                    redirect_to [@invite.team.patient, @invite.team]     
                else
                    flash[:error] = "#{@user.email} is already associated with an account, but there was an error adding this user to #{@invite.team.name}. Please try again."
                    render :new
                end
            else
                if
                    InviteMailer.new_user_invite(@invite, new_user_registration_url(:invite_token => @invite.token)).deliver
                    redirect_to [@invite.team.patient, @invite.team]       
                else
                    flash[:error] = "There was an error creating the invitation. Please try again."
                    render :new
                end
            end
        end
    end
    
    private
    
    def invite_params
        params.require(:invite).permit(:email, :team_id)
    end
end