class Teacher < ApplicationRecord
    belongs_to :person
    has_many :exams
    has_many :evaluations
    has_many :courses, through: :teacher_teaches_courses
end
