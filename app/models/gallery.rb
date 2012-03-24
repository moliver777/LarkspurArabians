class Gallery < ActiveRecord::Base
  has_many :images
  has_one :thumb
end
