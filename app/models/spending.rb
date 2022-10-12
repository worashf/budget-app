class Spending < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :spending_categories, dependent: :destroy
  has_many :categories, through: :spending_categories
end
