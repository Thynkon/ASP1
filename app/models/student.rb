class Student < Person
  has_many :semesters, through: :student_participates_in_semesters
  has_many :promotions, through: :student_belongs_to_promotions
  has_many :evaluations
  has_many :exams, through: :evaluations
end
