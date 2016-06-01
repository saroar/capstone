class PatientCaretaker < ActiveRecord::Base
 belongs_to :team
 belongs_to :caretaker
end
