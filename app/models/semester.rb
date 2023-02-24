class Semester < ApplicationRecord
    has_many :quarters 
    has_many :students, through: :student_participates_in_semesters
end
