class Talk < ActiveRecord::Base
  belongs_to :speaker, class_name: "User"
  belongs_to :guest

  has_many :events
  has_many :guests, through: :events, source: :guest

  has_many :hashtags
  has_many :tags, through: :hashtags, source: :tag
end
