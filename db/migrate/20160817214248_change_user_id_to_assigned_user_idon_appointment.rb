class ChangeUserIdToAssignedUserIdonAppointment < ActiveRecord::Migration
  def change
    rename_column :appointments, :user_id, :assigned_user_id
  end
end
