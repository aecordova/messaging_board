# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'

  validates :title, presence: true, length: { maximum: 255 }
  validates :body, presence: true
end
