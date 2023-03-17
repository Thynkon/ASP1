class Role < ApplicationRecord
    has_many :person_has_role, class_name: "PersonHasRole"
    has_many :people, through: :person_has_role
    
    validates :slug, presence: true, uniqueness: true, format: { with: /\A[a-zA-Z0-9]+\z/, message: "only allows letters and numbers" }, length: { minimum: 3, maximum: 10 }
    validates :name, presence: true, length: { minimum: 3, maximum: 45 }
end
