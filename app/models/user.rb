# frozen_string_literal: true

class User < ApplicationRecord
  has_many :posts
  validates :name, :email, presence: true
  scope :recent, -> { where('created_at > ?', 1.week.ago) }
end
