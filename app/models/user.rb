class User < ActiveRecord::Base
  has_many :sites
  class << self
	  def from_omniauth(auth_hash)
			user = find_or_create_by(:email => auth_hash.info.email)
      #if user has acc with other oauth provider return (resque in session ctrl.)
			if (user.provider !=nil && user.provider != auth_hash['provider'])
			return
			end
      #set user attributes from auth provider
	    user.name = auth_hash['info']['name']
			user.uid = auth_hash['uid']
			user.provider = auth_hash['provider']
	    user.image_url = auth_hash['info']['image']
	    user.email = auth_hash['info']['email']
	    user.save!
	    user
	  end
	end
end
