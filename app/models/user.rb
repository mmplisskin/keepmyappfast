class User < ActiveRecord::Base
  has_many :sites
  class << self
	  def from_omniauth(auth_hash)
			user = find_or_create_by(:email => auth_hash.info.email)
      # binding.pry
			if (user.provider !=nil && user.provider != auth_hash['provider'])
			return
			end
	    user.name = auth_hash['info']['name']
			user.uid = auth_hash['uid']
			user.provider = auth_hash['provider']
			# uid: auth_hash['uid'], provider: auth_hash['provider']
	    user.location = auth_hash['info']['location']
	    user.image_url = auth_hash['info']['image']
	    # user.url = auth_hash['info']['urls'][user.provider.capitalize]
	    user.email = auth_hash['info']['email']
	    user.save!
	    user
	  end
	end
end
