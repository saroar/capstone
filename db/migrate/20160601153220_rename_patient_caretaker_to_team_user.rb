class RenamePatientCaretakerToTeamUser < ActiveRecord::Migration
  def change
    rename_table :patients_caretakers, :teams_users
  end
end
