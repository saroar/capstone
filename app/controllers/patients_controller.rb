class PatientsController < ApplicationController
  def index
    # @patients = policy_scope(Patient)
    # above is ultimate goal, need to write policy_scope for patients
    @pateints = Patient.all
  end

  def show
    @patient = Patient.find(params[:id])
    # authorize @patient
  end

  def new
    @patient = Patient.new
    # authorize @patient
  end
  
  def create
    @patient = Patient.new(patient_params)
    @patient.creator_id = current_user.id
    patient_creation = PatientCreationService.new(@patient)
    # authorize @patient
    if patient_creation.perform
      flash[:notice] = "#{@patient.name} was saved as a patient."
      redirect_to [@patient]
    else
      flash[:notice] = "There was an error saving the patient. Please try again."
      render :new
    end
  end

  def edit
    @patient = Patient.find(params[:id])
    # authorize @patient
  end
  
  def update
    @patient = Patient.find(params[:id])
    # authorize @patient
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
