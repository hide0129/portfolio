class Image < ActiveRecord::Base
  mount_uploader :image, ImageUploader

  belongs_to :work
  validates :image, presence: true
end
