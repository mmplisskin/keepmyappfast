Rails.application.config.middleware.use OmniAuth::Builder do
	provider :facebook, ENV["facebook_client_id"], ENV["facebook_secret"], scope: 'email', info_fields: 'email, name'

	provider :google_oauth2, ENV["google_client_id"], ENV["google_secret"], scope: 'email', image_aspect_ratio: 'square', image_size: 48, access_type: 'online', name: 'google'

end
