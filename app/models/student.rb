class Student < ActiveRecord::Base
    belongs_to :teacher
    has_many :logs
end
