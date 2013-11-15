require File.expand_path("../../../../config/initializers.rb", __FILE__)
require 'rack/test'

describe Questionnaire::API do
	include Rack::Test::Methods

	def app
		Questionnaire::API
	end
	
	describe Questionnaire::API do
		describe "GET /hi" do
			it "returns message 'Hello To you'" do
				get "/hi"
				last_response.status.should == 200
				JSON.parse(last_response.body)["message"].should == "Hello To you"
			end
		end
	end	
end