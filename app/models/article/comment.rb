class Article
  class Comment < ApplicationRecord
    belongs_to :article
  end
end
