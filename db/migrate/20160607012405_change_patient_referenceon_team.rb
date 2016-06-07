class ChangePatientReferenceonTeam < ActiveRecord::Migration
  def change
    remove_reference :teams, :patient_id
    add_reference :teams, :patient
  end
end
