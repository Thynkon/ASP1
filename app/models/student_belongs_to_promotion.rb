class StudentBelongsToPromotion < ApplicationRecord
    belongs_to :student, foreign_key: :person_id, class_name: 'Student'
    belongs_to :promotion
end
