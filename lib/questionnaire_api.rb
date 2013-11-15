require 'grape'

module Questionnaire
	class API < Grape::API
		format :json		
		rescue_from :all do |e|
	        response = 
	        {
	            'error' => e.message.humanize        
	        }
	        Rack::Response.new(response.to_json, 400)
    	end

		resource :users do
			desc "CREATE a new user"
			params do
				requires :first_name, type: String, desc: "First Name" 
				requires :last_name, type: String, desc: "Last Name"
				requires :email, type: String, desc: "Email Address"
			end
			post do				
				User.create!({first_name: params[:first_name],
					  last_name: params[:last_name],
					  email: params[:email]})									
			end
			desc "RETRIEVE ALL Users"
			get do
				User.all
			end
			desc "RETRIEVE a single user given his Id"		
			params do
				requires :id, type: String, desc: "User Id"
			end	
			route_param :id do
				get do
					User.find(params[:id])
				end
			end
			desc "UPDATE a single user given his Id"		
			params do
				requires :id, type: String, desc: "User Id"
				optional :first_name, type: String, desc: "First Name" 
				optional :last_name, type: String, desc: "Last Name"
				optional :email, type: String, desc: "Email Address"
			end	
			put ':id' do	
				u = User.find(params[:id])
				u[:first_name] = params[:first_name] if params.key?("first_name")
				u[:last_name] = params[:last_name] if params.key?("last_name")
				u[:email] = params[:email] if params.key?("email")
				u.save!
			end
			desc "DELETE a single user given his Id"		
			params do
				requires :id, type: String, desc: "User Id"
			end	
			delete ':id' do
				User.find(params[:id]).destroy		
			end
		end
	end
end