class Evaluation < ApplicationRecord
    belongs_to :exam
    belongs_to :student
    belongs_to :teacher
end
