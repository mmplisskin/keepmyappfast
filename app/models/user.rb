class User < ActiveRecord::Base
  class << self
	  def from_omniauth(auth_hash)
			ouser = find_or_create_by(:email => auth_hash.info.email)
			if (ouser.provider !=nil && ouser.provider != auth_hash['provider'])

			return
			end
	    ouser.name = auth_hash['info']['name']
			ouser.uid = auth_hash['uid']
			ouser.provider = auth_hash['provider']
			# uid: auth_hash['uid'], provider: auth_hash['provider']
	    ouser.location = auth_hash['info']['location']
	    ouser.image_url = auth_hash['info']['image']
	    # ouser.url = auth_hash['info']['urls'][ouser.provider.capitalize]
	    ouser.email = auth_hash['info']['email']
			ouser.otp_secret_key
	    ouser.save!
	    ouser
	  end
	end
end
