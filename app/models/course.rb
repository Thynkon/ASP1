class Course < ApplicationRecord
    belongs_to :category
    belongs_to :quarter
    has_many :teacher_teaches_courses, dependent: :delete_all
    has_many :teachers, through: :teacher_teaches_courses, foreign_key: :person_id, dependent: :delete_all
    # Same as delete on cascade
    has_many :exams, dependent: :delete_all

    validates :slug, presence: true, uniqueness: true, format: { with: /\A[a-zA-Z0-9_]+\z/, message: "only allows letters, numbers and _" }, length: { minimum: 3, maximum: 20 }
    validates :title, presence: true, length: { minimum: 3, maximum: 45 }
end
