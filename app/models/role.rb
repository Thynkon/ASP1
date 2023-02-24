class Role < ApplicationRecord
    has_many :people, through: :person_has_roles
end
