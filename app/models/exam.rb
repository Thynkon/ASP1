class Exam < ApplicationRecord
    belongs_to :teacher
    has_many :evaluations
end
