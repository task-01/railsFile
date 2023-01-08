class Room < ApplicationRecord
  belongs_to :user
  has_many :registers
  # foreign_key: user_id
  mount_uploader :image, ImageUploader
  validates :roomName, presence: true
  validates :roomAddress, presence: true
  validates :roomIntroduction, presence: true
  validates :roomMoney, presence: true
end
