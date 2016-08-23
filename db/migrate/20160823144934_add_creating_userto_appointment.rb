class AddCreatingUsertoAppointment < ActiveRecord::Migration
  def change
    add_column :appointments, :creating_user_id, :integer
  end
end
