class ChangeTeamsUsers < ActiveRecord::Migration
  def change
    remove_reference :teams_users, :team_id
    remove_reference :teams_users, :user_id
    add_reference :teams_users, :team
    add_reference :teams_users, :user
  end
end
