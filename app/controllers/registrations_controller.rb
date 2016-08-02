class RegistrationsController < Devise::RegistrationsController
    # def new
    #     @invite = Invite.find_by(token: params[:invite_token])
    #     super
    #     if resource.save
    #         Teammate.create(team: @invite.team, user: current_user)
    #     end
    # end
    
    def new
        @invite = Invite.find_by(token: params[:invite_token])
        super
    end
    
    def create
        @invite = Invite.find_by(token: params[:user][:invite_token])
        super
        @user = User.find_by(email: params[:user][:email])
        Teammate.create(team: @invite.team, user: @user)
    end
            
    
    # def after_sign_up_path_for(resource)
    #     if @invite
    #         Teammate.create(team: @invite.team, user: current_user)
    #         super
    #     end
    # end
   
end