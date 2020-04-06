class Post < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_rich_text :description

  validates :image, presence: true
end
