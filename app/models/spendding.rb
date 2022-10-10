class Spendding < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :spendding_category, dependent: :destroy
  has_many :categories, through: :spendding_category
end
