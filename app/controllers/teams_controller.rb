class TeamsController < ApplicationController
  def index
    @teams = policy_scope(Team)
  end

  def show
    @team = Team.find(params[:id])
    authorize @team
  end

  def new
    @team = Team.new
    authorize @team
  end
  
  def create
    @team = Team.new(team_params)
    @team.user_id = User.find_by_email(params[:email])
    authorize @team
    if @team.save
      flash[:notice] = "#{@team.name} was saved as a care team."
      redirect_to [@team]
    else
      flash[:notice] = "There was an error saving the new team. Please try again."
      render :new
    end
  end

  def edit
    @team = Team.find(params[:id])
    authorize @team
  end
  
  def update
    @team = Team.find(params[:id])
    authorize @team
    if @team.update(team_params)
      flash[:notice] = "#{@team.name}'s information was updated."
      redirect_to [@team]
    else
      flash[:notice] = "There was an error updating #{@team.name}'s information. Please try again."
      render :edit
    end
  end
  
  private
  
  def patient_params
     params.require(:patient).permit(:name, :age, :address)
  end
end
