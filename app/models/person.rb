class Person < ActiveRecord::Base
  has_one :family_member
  has_one :family, through: :family_member
  scope :published, -> { where(published: true) }
  scope :pending, -> { where(published: false) }
  mount_uploader :photo, PhotoUploader
end
