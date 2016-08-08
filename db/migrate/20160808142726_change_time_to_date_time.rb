class ChangeTimeToDateTime < ActiveRecord::Migration
  def change
    rename_column :appointments, :time, :datetime
  end
end
