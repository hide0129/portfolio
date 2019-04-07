class Work < ActiveRecord::Base
  has_many :images, dependent: :destroy, inverse_of: :work
  accepts_nested_attributes_for :images, allow_destroy: true
end
