class DropCaretakersTable < ActiveRecord::Migration
  def change
    drop_table :caretakers
  end
end
