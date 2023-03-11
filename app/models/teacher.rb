class Teacher < Person
  has_many :exams
  has_many :evaluations
  has_many :courses, through: :teacher_teaches_courses
end
