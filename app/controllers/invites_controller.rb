class InvitesController < ApplicationController
    def new
        @invite = Invite.new
    end
    
    def create
        @invite = Invite.new(invite_params)
        @invite.sender_id = current_user.id
        if @invite.save 
            InviteMailer.new_user_invite(@invite, new_user_registration_url(:invite_token => @invite.token)).deliver
            redirect_to [@invite.team.patient]       
        else
            flash[:notice] = "There was an error creating the invitation. Please try again."
            render :new
        end
    end
    
    private
    
    def invite_params
        params.require(:invite).permit(:email, :team_id)
    end
end