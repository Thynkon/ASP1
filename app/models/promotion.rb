class Promotion < ApplicationRecord
    has_many :student_belongs_to_promotions, dependent: :destroy
    has_many :students, through: :student_belongs_to_promotions
    has_many :courses, dependent: :destroy
    
    validates :name, presence: true, uniqueness: true
    validates :started_at, presence: true
    validates :ended_at, presence: true
end
