# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy, foreign_key: :author_id
  has_many :comments, foreign_key: :author_id
  validates :username, presence: true, length: { in: 5..30 }
end
