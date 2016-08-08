class Appointment < ActiveRecord::Base
    belongs_to :team
    # attr_accessor :date, :time
   
    # def datetime
    #     self[:datetime] ||= Time.zone.now
    # end
    
    # def date=(date)
    #     puts date
    #     t = Time.zone.parse(date)
    #     puts date
    #     self.datetime = self.datetime.change(month: t.month, day: t.day, year: t.year)
    # end
    
    # def time=(time)
    #     hour = time[0].to_i
    #     min = time[3,4].to_i
    #     self.datetime = self.datetime.change(hour: hour, min: min)
    # end
end
