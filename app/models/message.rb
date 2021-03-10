class Message < ApplicationRecord
  belongs_to :user
  belongs_to :room
  has_one_attached :image
  has_many :notifications, dependent: :destroy

  validates :body, presence: true
end
