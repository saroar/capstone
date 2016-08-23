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
        @appointment.creating_user_id = current_user.id
        # @appointment.suggested_user_id = User.find_by_email(params[:user_email])
        @appointment.assigned_user_id = current_user.id if @appointment.assigned_user == 1
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
        @appointment = Appointment.find(params[:id])
    end
    
    def update
        @patient = Patient.find(params[:patient_id])
        @appointment = Appointment.find(params[:id])
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
        @appointment = Appointment.find(params[:id])
        @appointment.assigned_user = current_user if @appointment.assigned_user == 1
        if @appointment.destroy
            flash[:notice] = "#{@appointment.team.patient}'s appointment was deleted."
            redirect_to patient_team_path
        else
            flash[:error] = "Error deleting appointment. Please try again."
            render :show
        end
    end

    private
    
    def appointment_params
        params.require(:appointment).permit(:title, :doctor, :address, :datetime, :suggested_user_id)
    end
end
