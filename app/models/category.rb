class Category < ApplicationRecord
  belongs_to :user
  has_many :spending_categories, dependent: :destroy
  has_many :spendings, through: :spending_categories
end
