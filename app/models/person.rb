class Person < ApplicationRecord
    has_many :students
    has_many :teachers
    has_many :roles, through: :person_has_roles
    belongs_to :city
end
