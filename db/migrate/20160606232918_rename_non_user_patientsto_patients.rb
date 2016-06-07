class RenameNonUserPatientstoPatients < ActiveRecord::Migration
  def change
    rename_table :non_user_patients, :patients
  end
end
