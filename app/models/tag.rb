class Tag < ActiveRecord::Base
  validates_presence_of :name

  has_many :hashtags
  has_many :talks, through: :hashtags, source: :talk
end
