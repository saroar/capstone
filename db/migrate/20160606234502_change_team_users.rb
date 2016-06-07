class ChangeTeamUsers < ActiveRecord::Migration
  def change
    remove_column :teams_users, :patients_id
    remove_column :teams_users, :caretakers_id
    add_reference :teams_users, :user_id, index: true
    add_reference :teams_users, :team_id, index: true
  end
end
