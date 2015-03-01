class StaticController < ApplicationController
    def welcome
        @counter = 1
        @teachers = Teacher.all
    end
end
