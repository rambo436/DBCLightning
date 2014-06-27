class Hashtag < ActiveRecord::Base
  belongs_to :talk
  belongs_to :tag
end
