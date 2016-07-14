class AddCreatortoPatient < ActiveRecord::Migration
  def change
    add_column :patients, :creator_id, :integer
  end
end
