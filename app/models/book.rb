class Book < ApplicationRecord
  has_many :reviews
  has_many :users, through: :reviews
  has_many :book_tags
  has_many :tags, through: :book_tags
end
