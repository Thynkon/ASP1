class Promotion < ApplicationRecord
    has_many :students, through: :student_belongs_to_promotions
end
