# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# Create admin role if it doesn't exist

require 'faker'
Faker::Config.locale = :en
I18n.reload!

### Roles
admin_role = Role.find_or_create_by(slug: "admin", name: "Administrator")
user_role = Role.find_or_create_by(slug: "user", name: "User")

### Users
#admin_user = Teacher.find_or_create_by(email: "thynkon@asdf.asdf", password: "asdfasdf", password_confirmation: "asdfasdf", roles: [admin_role, user_role])
# First or create the user if exists
admin_user = Teacher.create(email: "teacher@cpnv.ch", password: "asdfasdf", password_confirmation: "asdfasdf", roles: [admin_role])
student_user = Student.create(email: "student@cpnv.ch", password: "asdfasdf", password_confirmation: "asdfasdf", roles: [user_role])

### Seeders
# Create seeders for the cities in switzerland
zurich = City.create!(name: "Zurich", zip_code: 8000)
geneva = City.create!(name: "Geneva", zip_code: 1201)
basel = City.create!(name: "Basel", zip_code: 4051)
bern = City.create!(name: "Bern", zip_code: 3000)
lausanne = City.create!(name: "Lausanne", zip_code: 1000)

# Semesters and quarters
semester_1 = Semester.create!(started_at: Date.new(2020, 9, 1), ended_at: Date.new(2021, 1, 31))
semester_2 = Semester.create!(started_at: Date.new(2021, 2, 1), ended_at: Date.new(2021, 6, 30))
semester_3 = Semester.create!(started_at: Date.new(2021, 7, 1), ended_at: Date.new(2021, 12, 31))

# Create seeders for the quarters
quarter_1 = Quarter.create!(started_at: Date.new(2020, 9, 1), ended_at: Date.new(2020, 12, 31), semester: semester_1)
quarter_2 = Quarter.create!(started_at: Date.new(2021, 1, 1), ended_at: Date.new(2021, 3, 31), semester: semester_1)
quarter_3 = Quarter.create!(started_at: Date.new(2021, 4, 1), ended_at: Date.new(2021, 6, 30), semester: semester_2)
quarter_4 = Quarter.create!(started_at: Date.new(2021, 7, 1), ended_at: Date.new(2021, 9, 30), semester: semester_3)
quarter_5 = Quarter.create!(started_at: Date.new(2021, 10, 1), ended_at: Date.new(2021, 12, 31), semester: semester_3)

### Create seeders for the categories
# Create seeders for the categories
general_modules = Category.create(slug: 'general_modules', name: 'Modules généraux', parent: nil)

# Create seeders for the categories
specific_modules = Category.create(slug: 'specific_modules', name: 'Modules spécifiques', parent: nil)
dev_modules = Category.create(slug: 'dev_modules', name: 'Modules de développement', parent: specific_modules)
uml = Course.create(slug: 'UML1', title: 'UML1', description: 'Modéliser des applications Web en UML, processus de développement', category: dev_modules, quarter: quarter_1)
poo1 = Course.create(slug: 'POO1', title: 'POO1', description: 'Concepts MVC avancés. Utilisation d’un ORM.', category: dev_modules, quarter: quarter_1)
jav1 = Course.create(slug: 'JAV1', title: 'JAV1', description: 'Créer des applications Android en JAVA', category: dev_modules, quarter: quarter_1)
poo2 = Course.create(slug: 'POO2', title: 'POO2', description: 'Algorithmes et structures de données, Design Patterns, Test Driven Development', category: dev_modules, quarter: quarter_1)
hkg1 = Course.create(slug: 'HKG1', title: 'HKG1', description: 'Cross-site scripting, injection SQL', category: dev_modules, quarter: quarter_1)

### web_dev_modules
web_dev_modules = Category.create(slug: 'web_dev_modules', name: 'Modules de développement web', parent: specific_modules)
prw1 = Course.create(slug: 'PRW1', title: 'PRW1', description: 'Programmation Web : XHTML, CSS, Javascript, PHP', category: web_dev_modules, quarter: quarter_1)
gui1 = Course.create(slug: 'GUI1', title: 'GUI1', description: 'Techniques de conception et réalisation d\'interfaces utilisateur', category: web_dev_modules, quarter: quarter_1)
gui2 = Course.create(slug: 'GUI2', title: 'GUI2', description: 'Pratique de conception et réalisation d\'interfaces utilisateur', category: web_dev_modules, quarter: quarter_1)
prw2 = Course.create(slug: 'PRW2', title: 'PRW2', description: 'Programmation PHP : POO, MVC et frameworks', category: web_dev_modules, quarter: quarter_1)
ria1 = Course.create(slug: 'RIA1', title: 'RIA1', description: 'Rich Internet Application : Services web, microformats, Ajax, JS et librairies', category: web_dev_modules, quarter: quarter_1)
mob1 = Course.create(slug: 'MOB1', title: 'MOB1', description: 'Applications mobiles en framework hybride (Ionic, React, Flutter)', category: web_dev_modules, quarter: quarter_1)
awa1 = Course.create(slug: 'AWA1', title: 'AWA1', description: 'Advanced Web Animations', category: web_dev_modules, quarter: quarter_1)

database_modules = Category.create(slug: 'database_modules', name: 'Modules liés aux bases de données', parent: specific_modules)
sql1 = Course.create(slug: "SQL1", title: "SQL1", description: "Manipuler des données à l'aide de SQL et modélisation des données", category: database_modules, quarter: quarter_1)
nos1 = Course.create(slug: "NOS1", title: "NOS1", description: "Bases de de données NOSQL", category: database_modules, quarter: quarter_1)
sql2 = Course.create(slug: "SQL2", title: "SQL2", description: "SQL Server : Installation, configuration, programmation T-SQL", category: database_modules, quarter: quarter_1)
bi1 = Course.create(slug: "BI1", title: "BI1", description: "Business Intelligence", category: database_modules, quarter: quarter_1)


system_modules = Category.create(slug: 'system_modules', name: 'Modules système', parent: specific_modules)
cld1 = Course.create(slug: "CLD1", title: "Linux: Système de fichiers et Administration de base + mise en place hébergement Web mutualisé", category: system_modules, quarter: quarter_1)
daw = Course.create(slug: "DAW", title: "Déploiement d’Application Web en Local (DAW)", category: system_modules, quarter: quarter_1)
cld2 = Course.create(slug: "CLD2", title: "Modification et déploiement de solutions dans le cloud, serverless", category: system_modules, quarter: quarter_1)
vir1 = Course.create(slug: "VIR1", title: "Administration d’une plateforme de virtualisation", category: system_modules, quarter: quarter_1)

professional_experience_modules = Category.create(slug: 'prof_exp', name: 'Modules d\'application et expérience professionnelle', parent: nil)
projects_and_internships = Category.create(slug: 'proj_intern', name: 'Projets et stages en entreprise', parent: professional_experience_modules)
gpr1 = Course.create(slug: "GPR1", title: "GPR1", description: "Gestion de projet + éthique et culture d'entreprise", category: projects_and_internships, quarter: quarter_1)
itil_com = Course.create(slug: "ITIL_COM", title: "ITIL_COM", description: "ITIL", category: projects_and_internships, quarter: quarter_1)
maw_1_1 = Course.create(slug: "MAW1.1", title: "MAW1.1", description: "E-commerce", category: projects_and_internships, quarter: quarter_1)
maw_1_2_communication = Course.create(slug: "MAW1.2_com", title: "MAW1.2 Communication", description: "Framework", category: projects_and_internships, quarter: quarter_1)
maw_1_2_technical = Course.create(slug: "MAW1.2_tech", title: "MAW1.2 Technique", description: "Framework", category: projects_and_internships, quarter: quarter_1)


internship = Category.create(slug: 'internship', name: 'Stages Techniciens', parent: professional_experience_modules)
general_branches = Category.create(slug: 'general_branches', name: 'Branches générales', parent: nil)
physics = Course.create(slug: "PHY", title: "Physique", category: general_branches)
maths = Course.create(slug: "MATH", title: "Mathématiques", category: general_branches)
english = Course.create(slug: "ANG", title: "Anglais", category: general_branches)
french = Course.create(slug: "FR", title: "Français", category: general_branches)
economy = Course.create(slug: "GEO", title: "Gestion et Organisation", category: general_branches)

# Promotions
promotion_1 = Promotion.create!(name: "Promotion 2021/2022", started_at: Date.new(2021, 9, 1), ended_at: Date.new(2022, 6, 30))
promotion_2 = Promotion.create!(name: "Promotion 2022/2023", started_at: Date.new(2022, 9, 1), ended_at: Date.new(2023, 6, 30))

# Students
student_1 = Student.create!(firstname: Faker::Name.firstname, lastname: Faker::Name.lastname, email: Faker::Internet.email, password: "asdfasdf", roles: [user_role])
student_1.promotions << promotion_1
student_1.save!

student_2 = Student.create!(firstname: Faker::Name.firstname, lastname: Faker::Name.lastname, email: Faker::Internet.email, password: "asdfasdf", roles: [user_role])
student_2.promotions << promotion_1
student_2.save!

# Teachers
number_of_courses = Course.count
teachers = []
courses = []
0.upto(number_of_courses - 1) do |i|
  course = Course.order(:id).limit(1).offset(i).first
  teacher = Teacher.create!(firstname: Faker::Name.firstname, lastname: Faker::Name.lastname, email: Faker::Internet.email, password: "asdfasdf", roles: [user_role])
  course.teachers << teacher
  course.save!

  teachers << teacher
  courses << course
end

0.upto(number_of_courses - 1) do |i|
  exam = Exam.create!(name: Faker::Name.title, weight: Faker::Number.between(from: 0.1, to: 3.0), teacher: teachers.sample, course: courses.sample)
  exam.save!
end

# Create seeders for the schools
# Create seeders for the students
# Create seeders for the exams
# Create seeders for the evaluations

# Create seeders for all models
