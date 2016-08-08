class ChangeDatetoTime < ActiveRecord::Migration
  def change
    rename_column :appointments, :date, :time
  end
end
