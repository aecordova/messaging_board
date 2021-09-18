# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :author, class_name: 'User'

  validates :content, presence: true, length: { maximum: 255 }

  scope :most_recent_first, -> { order(created_at: :desc) }
end
