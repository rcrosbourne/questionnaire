require 'grape'

module Questionnaire
	class API < Grape::API
		format :json

		desc "This is a simple test"
		get :hi do
			{message: "Hello To you"}
		end
	end
end