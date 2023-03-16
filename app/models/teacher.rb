class Teacher < Person
  has_many :exams, foreign_key: :person_id
  has_many :evaluations
  has_many :teacher_teaches_courses
  has_many :courses, through: :teacher_teaches_courses
end
