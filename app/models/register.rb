class Register < ApplicationRecord
  belongs_to :room
  # foreign_key :room
  # validates :roomName, presence: true
  # validates :roomAddress, presence: true
  # validates :roomIntroduction, presence: true
  # validates :roomMoney, presence: true
  validates :number, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validate :start_end_check

  private
  
  def start_end_check
    if end_date.present? || start_date.present?
      if end_date < start_date
        errors.add(:end_date, 'は開始日より前の日を予約することはできません。')
      end
    end
  end
  mount_uploader :image, ImageUploader
end
