class Category < ApplicationRecord
    has_many :courses, dependent: :delete_all

    acts_as_nested_set
    
    validates :slug, presence: true, uniqueness: true, format: { with: /\A[a-zA-Z0-9_]+\z/, message: "only allows letters, numbers and _" }, length: { minimum: 3, maximum: 20 }
    validates :name, length: { minimum: 3, maximum: 45 }
end
