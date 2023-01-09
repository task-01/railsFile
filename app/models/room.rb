class Room < ApplicationRecord
  belongs_to :user
  has_many :registers
  # foreign_key: user_id
  mount_uploader :image, ImageUploader
  validates :roomMoney, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0}
  validates :roomName, presence: true
  validates :roomAddress, presence: true
  validates :roomIntroduction, presence: true
  validates :roomMoney, presence: true
end
