require 'mongoid'

class User
	include Mongoid::Document
	include Mongoid::Timestamps

	field :first_name, type: String
	field :last_name, type: String
	field :email, type: String

	#validations.
	validates :first_name, presence: true, allow_blank: false
	validates :last_name, presence: true, allow_blank: false
	validates :email, presence: true, 
				format: {with: /\A[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\z/i}, 
				uniqueness: { case_sensitive: false }
end