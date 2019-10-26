class Question < ApplicationRecord
  belongs_to :user
  has_many :comments, as: :commentable
  has_rich_text :content
end
