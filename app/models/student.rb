class Student < ActiveRecord::Base
    belongs_to :teacher
    has_many :logs
    
    before_save :upperCase
    
    def upperCase
        self.name = self.name.titleize
    end
end
