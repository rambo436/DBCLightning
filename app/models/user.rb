class User < ActiveRecord::Base
  has_many :talks
  has_many :tags, through: :talks
end
