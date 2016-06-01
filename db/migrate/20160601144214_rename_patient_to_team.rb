class RenamePatientToTeam < ActiveRecord::Migration
  def change
    rename_table :patients, :teams
  end
end
