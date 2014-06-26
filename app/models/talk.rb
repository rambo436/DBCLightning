class Talk < ActiveRecord::Base
  belongs_to :speaker, class_name: "User", foreign_key: :user_id
  has_and_belongs_to_many :tags

end
