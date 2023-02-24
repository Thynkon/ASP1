class StudentParticipatesInSemester < ApplicationRecord
    belongs_to :students
    belongs_to :semesters
end
