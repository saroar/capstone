class AppointmentsController < ApplicationController
    def index
        @team = Team.find(params[:id])
        @appointments = @team.appointments
    end
    
    def show
        @appointment = Appointment.find(params[:id])
    end
    
    def new
        @team = Team.find(params[:team_id])
        @appointment = Appointment.new
    end
    
    def create
        @appointment = Appointment.new(appointment_params)
        @team = Team.find(params[:team_id])
        @appointment.team = @team
        if @appointment.save
            flash[:notice] = "#{@appointment.team.patient}'s appointment with #{@appointment.doctor} was saved succesfully."
            redirect_to [@team]
        else
            flash[:error] = "There was an error saving the appointment. Please try again."
            render :new
        end
    end
    
    def edit
        @appointment = Appointment.find(params[:id])
    end
    
    def update
        @appointment = Appointment.find(params[:appointment_id])
        if @appointment.update_attributes(appointment_params)
            flash[:notice] = "#{@appointment.team.patient}'s appointment has been successfully updated."
            redirect_to @appointment.team
        else
            flash[:notice] = "There was an error updating #{@appointment.team.patient}'s appointment. Please try again."
            render :edit
        end
    end
    
    def destroy
        @appointment = Appointment.find(params[:id])
        if @appointment.destroy
            flash[:notice] = "#{@appointment.team.patient}'s appointment was deleted."
            redirect_to @appointment.team
        else
            flash[:error] = "Error deleting appointment. Please try again."
            render :show
        end
    end
            
    private
    
    def appointment_params
        params.require(:appointment).permit(:title, :doctor, :address, :date)
    end
end
