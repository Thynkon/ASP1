class Person < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :person_has_role, class_name: "PersonHasRole"
  has_many :roles, through: :person_has_roles
  belongs_to :city, optional: true
end
