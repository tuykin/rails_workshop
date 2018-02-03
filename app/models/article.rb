class Article < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :category
  validates :title, presence: true,
                    length: { minimum: 5 }

  state_machine :state, initial: :draft do
    event :send_to_moderation do
      transition :draft => :on_moderation
    end

    event :publish do
      transition :on_moderation => :published
    end
  end
end
