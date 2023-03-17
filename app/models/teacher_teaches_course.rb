class TeacherTeachesCourse < ApplicationRecord
    belongs_to :teacher, foreign_key: :person_id, class_name: 'Teacher'
    belongs_to :course
end
