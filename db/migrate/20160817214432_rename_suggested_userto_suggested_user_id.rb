class RenameSuggestedUsertoSuggestedUserId < ActiveRecord::Migration
  def change
    rename_column :appointments, :suggested_user, :suggested_user_id
  end
end
