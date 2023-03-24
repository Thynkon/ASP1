class Evaluation < ApplicationRecord
    belongs_to :exam
    belongs_to :student, class_name: 'Student'
    belongs_to :teacher, class_name: 'Teacher'

    # "Belongs to through"
    # Reference: https://stackoverflow.com/a/11457714
    delegate :course, to: :exam

    validates :grade, presence: true, numericality: { greater_than_or_equal_to: 1.0, less_than_or_equal_to: 6.0 }
    validates :exam, presence: true
    validates :student, presence: true
    validates :teacher, presence: true
end
