# frozen_string_literal: true

class Article < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true
  validates :slug, presence: true, uniqueness: true

  # 'scope' and Class methods are the same thing
  # it would be like:
  # def self.recent
  #   order(created_at: :desc)
  # end

  scope :recent, -> { order(created_at: :desc) }
end
