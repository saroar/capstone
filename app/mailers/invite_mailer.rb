class InviteMailer < ApplicationMailer
    default from: "tpalid@gmail.com"
    
    def new_user_invite(invite, invite_url)
        @sender = invite.sender
        @patient = invite.team.patient
        @invite_url = invite_url
        mail(to: invite.email)
    end
    
    def existing_user_invite(invite)
        @sender = invite.sender
        @patient = invite.team.patient
        @team = invite.team
        mail(to: invite.email)
    end
end
