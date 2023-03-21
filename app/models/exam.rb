class Exam < ApplicationRecord
    belongs_to :teacher, foreign_key: :person_id, class_name: 'Teacher'
    belongs_to :course, foreign_key: :course_id, class_name: 'Course'
    has_many :evaluations
end
