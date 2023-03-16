class Course < ApplicationRecord
    #belongs_to :teachers, through: :teacher_teaches_courses
    belongs_to :category
    belongs_to :quarter
end
