class User < ActiveRecord::Base
  has_many :events
  has_many :talks, through: :events, source: :speaker
  has_many :presented_talks, through: :events, source: :user
  has_many :presented_talks, -> (user) { where speaker_id: user.id }, class_name: 'Talk', foreign_key: :id
  has_many :attendances, -> (user) { where attending?: true }, class_name: 'Event'
end
