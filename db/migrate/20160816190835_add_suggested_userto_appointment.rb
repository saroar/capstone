class AddSuggestedUsertoAppointment < ActiveRecord::Migration
  def change
    add_column :appointments, :suggested_user, :integer
  end
end
