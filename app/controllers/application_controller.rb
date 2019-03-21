class ApplicationController < ActionController::API

	def check_token
		@auth = request.headers["auth"]
		@device = Device.find_by(token: @auth)
		return !@device.nil?
	end

	def success
		render :json => success_json
	end

	def success_json
		{
			statusCode: 200,
			message: "success"
		}
	end

	def fail_to_save (message)
		render :json => {
			statusCode: 201,
			message: message
		}
	end

	def unauthorized
		render :json => {
			statusCode: 403,
			message: "Unauthorized"
		}
	end
end
