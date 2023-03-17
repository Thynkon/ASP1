class City < ApplicationRecord
    has_many :people
    
    validates :name, presence: true, length: { minimum: 3, maximum: 45 }
    validates :zip_code, presence: true, numericality: { only_integer: true }
end
