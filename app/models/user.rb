class User < ActiveRecord::Base
  has_secure_password
  has_many :events
  has_many :talks, through: :events, source: :user
  # has_many :presented_talks, through: :events, source: :user
  has_many :presented_talks, class_name: 'Talk', foreign_key: :speaker_id
  # has_many :attendances, -> (user) { where attending: true }, class_name: 'Event'
  
  def attendances
    events.attending
  end
end


# user.events # all events that user is attending
# user.talks # all talks user is attending
# user.presented_talks # all the talks for which user is a speaker
# user.events.attending
