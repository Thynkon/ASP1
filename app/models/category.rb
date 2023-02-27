class Category < ApplicationRecord
    has_many :children, foreign_key: :category_id, class_name: 'Category'
    belongs_to :parent, foreign_key: :category_id, class_name: 'Category'
end