class Room < ApplicationRecord
  belongs_to :user
  has_many :registers
  # foreign_key: user_id
  mount_uploader :image, ImageUploader
  validates :roomName, presence: true
  validates :roomAddress, presence: true
  validates :roomIntroduction, presence: true
  validates :roomMoney, presence: true
  # validates :number, presence: true
  # validates :start_date, presence: true
  # validates :end_date, presence: true
  # validate :start_end_check

  # def start_end_check
  #   errors.add(:end_date, "は開始日より前の日付は登録できません。") unless
  #   self.start_date < self.end_date 
  # end
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :validatable
end
