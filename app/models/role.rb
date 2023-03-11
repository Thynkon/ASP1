class Role < ApplicationRecord
    has_many :person_has_role, class_name: "PersonHasRole"
    has_many :people, through: :person_has_role
end
