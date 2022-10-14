class Spending < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :spending_categories, dependent: :destroy
  has_many :categories, through: :spending_categories
  validates :name, presence: true
  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
