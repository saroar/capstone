class AppointmentsController < ApplicationController
    autocomplete :user, :email
    # def index
    #     @team = Team.find(params[:id])
    #     @appointments = @team.appointments
    # end
    
    def show
        @patient = Patient.find(params[:patient_id])
        @team = @patient.team
        @appointment = Appointment.find(params[:id])
    end
    
    def new
        @patient = Patient.find(params[:patient_id])
        @team = @patient.team
        @appointment = Appointment.new
    end
    
    def create
        @appointment = Appointment.new(appointment_params)
        @patient = Patient.find(params[:patient_id])
        @team = @patient.team
        @appointment.team = @team
        @appointment.suggested_user = User.find_by_email(params[:user_email])
        @appointment.assigned_user = current_user if @appointment.assigned_user == 1
        if @appointment.save
            flash[:notice] = "#{@appointment.team.patient}'s appointment with #{@appointment.doctor} was saved succesfully."
            redirect_to [@patient, @team]
        else
            flash[:error] = "There was an error saving the appointment. Please try again."
            render :new
        end
    end
    
    def edit
        @patient = Patient.find(params[:patient_id])
        @team = @patient.team
        @appointment = Appointment.find(params[:id])
    end
    
    def update
        @patient = Patient.find(params[:patient_id])
        @appointment = Appointment.find(params[:format])
        @appointment.suggested_user = User.find_by_email(params[:user_email])
        if @appointment.update_attributes(appointment_params)
            flash[:notice] = "#{@appointment.team.patient.name}'s appointment has been successfully updated."
            redirect_to patient_team_path
        else
            flash[:notice] = "There was an error updating #{@appointment.team.patient.name}'s appointment. Please try again."
            render :edit
        end
    end
    
    def destroy
        @patient = Patient.find(params[:patient_id])
        @appointment = Appointment.find(params[:format])
        @appointment.assigned_user = current_user if @appointment.assigned_user == 1
        if @appointment.destroy
            flash[:notice] = "#{@appointment.team.patient}'s appointment was deleted."
            redirect_to patient_team_path
        else
            flash[:error] = "Error deleting appointment. Please try again."
            render :show
        end
    end
    
    def get_autocomplete_items(parameters)
        items = active_record_get_autocomplete_items(parameters)
        # items = items.where(searchable: true)
        # @patient = Patient.find(params[:patient_id])
        # @team = @patient.team
        # items = @team.users
        @team = Team.find(params[:team_id])
        items = items.where(:id => @team.team_memberships.pluck(:user_id))
        # items = super(parameters)
        # items = items.where(:user_id => .id)
        # super(parameters).where(:institution_id => params[:institution_id])
        #users where team.users includes user
    end
            
    private
    
    def appointment_params
        params.require(:appointment).permit(:title, :doctor, :address, :datetime)
    end
end
