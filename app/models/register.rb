class Register < ApplicationRecord
  belongs_to :room
  # foreign_key :room
  mount_uploader :image, ImageUploader
end
