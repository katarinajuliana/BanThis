class Person < ActiveRecord::Base
  scope :published, -> { where(published: true) }
  scope :pending, -> { where(published: false) }
  mount_uploader :photo, PhotoUploader
end
