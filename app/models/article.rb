class Article < ApplicationRecord
  validates :title, presence: true, length: {maximum: 50}
  validates :body, presence: true, length: {minimum: 10}
end
