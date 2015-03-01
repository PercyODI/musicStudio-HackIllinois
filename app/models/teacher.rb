class Teacher < ActiveRecord::Base
    has_many :students
    
    before_save :upperCase
    
    def upperCase
        self.name = self.name.titleize
        self.primaryInstrument = self.primaryInstrument.titleize
        self.location = self.location.titleize
    end
end
