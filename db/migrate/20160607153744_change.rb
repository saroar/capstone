class Change < ActiveRecord::Migration
  def change
    rename_table :teams_users, :teammates
  end
end
