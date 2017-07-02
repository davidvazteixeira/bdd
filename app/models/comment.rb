class Comment < ApplicationRecord
  belongs_to :article
  belongs_to :user

  scope :persisted, -> { where.not(id: nil) }

  validates :body, presence: true
end
