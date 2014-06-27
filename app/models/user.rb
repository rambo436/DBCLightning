class User < ActiveRecord::Base
	has_secure_password
  has_many :talks
  has_many :tags, through: :talks
	validates :email, :format => {:with => %r{.+@.+\..{2,}}, 
	:message => "Oops, please enter a valid email." }, :uniqueness => true}
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
