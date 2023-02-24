class StudentBelongsToPromotion < ApplicationRecord
    belongs_to :student
    belongs_to :promotion
end
