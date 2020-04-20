class Game < ApplicationRecord
  validates_presence_of :name, :gameimage
  mount_uploader :gameimage, GameimageUploader

  has_many :groups
end
