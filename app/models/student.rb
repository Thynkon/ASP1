class Student < Person
  has_many :student_participates_in_semesters, foreign_key: :person_id
  has_many :semesters, through: :student_participates_in_semesters
  has_many :student_belongs_to_promotions, foreign_key: :person_id
  has_many :promotions, through: :student_belongs_to_promotions
  has_many :evaluations
  has_many :exams, through: :evaluations
end
