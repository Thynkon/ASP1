class Exam < ApplicationRecord
    belongs_to :teacher, foreign_key: :person_id, class_name: 'Teacher'
    belongs_to :course, foreign_key: :course_id, class_name: 'Course'
    has_many :evaluations, dependent: :delete_all

    alias_attribute :teacher_id, :person_id

    validates :name, presence: true
    validates :weight, presence: true, numericality: { greater_than_or_equal_to: 0.0, less_than_or_equal_to: 5.0 }
    validates :teacher, presence: true
    validates :course, presence: true
end
