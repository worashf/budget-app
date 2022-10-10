class User < ApplicationRecord
  has_many :spenddings, dependent: :destroy
  has_many :categories, dependent: :destroy
end
