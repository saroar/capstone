class ChangeTeams < ActiveRecord::Migration
  def change
    remove_column :teams, :age
    remove_column :teams, :address
    remove_column :teams, :user_id
    add_reference :teams, :patient_id
  end
end
