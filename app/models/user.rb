class User < ActiveRecord::Base

has_many :groups
has_many :member_chores

	validates :name, presence: true
	validates :role, presence: true
	validates :phone, presence: true
	validates :email, presence: true

	validates_length_of :phone, minimum: 10, maximum: 10
	validates_uniqueness_of :email
	validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create
	def password
  		@password
    end

	def password=(new_password)
	  	 @password = new_password
	    self.password_digest = BCrypt::Password.create(new_password)
	end

	def authenticate(test_password)
	    if BCrypt::Password.new(self.password_digest) == test_password
	      self
	    else
	      false
	    end
	end
end