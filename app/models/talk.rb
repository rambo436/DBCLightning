class Talk < ActiveRecord::Base
  # validates_presence_of :min_rsvp
  belongs_to :speaker, class_name: "User"
  belongs_to :guest

  has_many :events
  has_many :guests, through: :events, source: :guest

  has_many :hashtags
  has_many :tags, through: :hashtags, source: :tag

  def actual_guests
    Talk.guests
  end


end
