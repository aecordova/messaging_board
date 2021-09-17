# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments

  validates :title, presence: true, length: { maximum: 255 }
  validates :body, presence: true

  scope :most_recent_first, -> { order(created_at: :desc) }
end
