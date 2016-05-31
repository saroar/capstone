class PatientsController < ApplicationController
  def index
    @patients = Patient.all
  end

  def show
    @patient = Patient.find(params[:id])
  end

  def new
    @patient = Patient.new
  end
  
  def create
    @patient = Patient.new(patient_params)
    if @patient.save
      flash[:notice] = "#{@patient.name} was saved as a patient."
      redirect_to [@patient]
    else
      flash[:notice] = "There was an error saving the new patient. Please try again."
      render :new
    end
  end

  def edit
    @patient = Patient.find(params[:id])
  end
  
  def update
    @patient = Patient.find(params[:id])
    if @patient.update(patient_params)
      flash[:notice] = "#{@patient.name}'s information was updated."
      redirect_to [@patient]
    else
      flash[:notice] = "There was an error updating #{@patient.name}'s information. Please try again."
      render :edit
    end
  end
  
  private
  
  def patient_params
     params.require(:patient).permit(:name, :age, :address)
  end
end
