class Category < ApplicationRecord
  belongs_to :user
  has_many :spending_categories, dependent: :destroy
  has_many :spendings, through: :spending_categories
  validates :name, :icon, presence: true

  def category_total
    spendings.sum(&:amount)
  end
end
