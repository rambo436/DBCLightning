class User < ActiveRecord::Base
	has_secure_password
  has_many :talks, through: :users_talks
	validates :email, uniqueness: true
	validates :first_name, presence: true
	validates :last_name, presence: true


	def password
		@password ||= Password.new(password_digest)
	end

	def password=(new_password)
		@password = Password.create(new_password)
		self.password_hash = @password
	end
end
