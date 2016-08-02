class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.string :title
      t.string :doctor
      t.string :address
      t.datetime :date

      t.timestamps null: false
    end
  end
end
