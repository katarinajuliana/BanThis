class Person < ActiveRecord::Base
  scope :published, -> { where(published: true) }
  mount_uploader :photo, PhotoUploader
end
