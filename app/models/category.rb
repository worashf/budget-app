class Category < ApplicationRecord
  belongs_to :user
  has_many :spendding_category, dependent: :destroy
  has_many :spenddings, through: :spendding_category
end
