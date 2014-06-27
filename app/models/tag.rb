class Tag < ActiveRecord::Base
  has_many :hashtags
  has_many :talks, through: :hashtags, source: :talk
end
