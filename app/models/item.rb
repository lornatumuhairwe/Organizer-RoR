class Item < ApplicationRecord
  belongs_to :category
  validates :category_id, presence: true
  validates :title, presence: true
end
