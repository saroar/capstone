class CreatePatientsCaretakers < ActiveRecord::Migration
  def change
    create_table :patients_caretakers do |t|
      t.references :patients
      t.references :caretakers
      t.timestamps null: false
    end
  end
end
