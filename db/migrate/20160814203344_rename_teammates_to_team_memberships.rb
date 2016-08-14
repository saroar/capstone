class RenameTeammatesToTeamMemberships < ActiveRecord::Migration
  def change
    rename_table :teammates, :team_memberships
  end
end
