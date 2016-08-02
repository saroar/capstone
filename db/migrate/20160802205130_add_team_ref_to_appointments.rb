class AddTeamRefToAppointments < ActiveRecord::Migration
  def change
    add_reference :appointments, :team, index: true, foreign_key: true
  end
end
