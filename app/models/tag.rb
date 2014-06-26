class Tag < ActiveRecord::Base
  has_and_belongs_to_many :talks
  has_many :users, through: :talks #Not necessary but we are doing it.
end
