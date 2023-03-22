class Evaluation < ApplicationRecord
    belongs_to :exam
    belongs_to :student, class_name: 'Student'
    belongs_to :teacher, class_name: 'Teacher'

    # "Belongs to through"
    # Reference: https://stackoverflow.com/a/11457714
    delegate :course, to: :exam
end
