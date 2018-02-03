class Article::Comment::Like < ApplicationRecord
  belongs_to :comment
end
