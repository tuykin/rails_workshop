class Article::Comment < ApplicationRecord
  belongs_to :article

  validates :commentor, presence: true
  validates :body, presence: true
end
