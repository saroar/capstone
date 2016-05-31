class PatientCaretaker < ActiveRecord::Base
 belongs_to :patient
 belongs_to :caretaker
end
