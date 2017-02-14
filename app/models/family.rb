class Family < ActiveRecord::Base
  has_many :family_members
  has_many :people, through: :family_members
end