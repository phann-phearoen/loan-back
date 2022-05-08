class Api::V1::TokensController < Doorkeeper::TokensController
	def create
		body = authorize_response.body
		oauth = OauthAccessToken.select(:resource_owner_id).where(token: body['access_token']).last
		if oauth
			user_id = oauth.resource_owner_id

			if user_id
				user = User.get_user_by_id user_id
				body.merge!(user: user)
				headers.merge!(authorize_response.headers)
				render json: body,
					status: authorize_response.status				
			else
				logger.debug "[debug] no user exists!"
				render status: 404 # wrong user
			end
		else
			logger.debug "[debug] no token exists!"
			render json: body,
				status: authorize_response.status # wrong password
		end
	end
end