class Exam < ApplicationRecord
    belongs_to :teacher, foreign_key: :person_id
    has_many :evaluations
end
