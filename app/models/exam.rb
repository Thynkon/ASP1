class Exam < ApplicationRecord
    belongs_to :teacher, foreign_key: :person_id, class_name: 'Teacher'
    has_many :evaluations
end
