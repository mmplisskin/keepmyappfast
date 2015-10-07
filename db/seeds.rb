# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
 #<User id: 2, provider: "facebook", uid: "10205257482010199", name: "ΜΔχ Πλισσκιν", email: "mmplisskin@gmail.com", location: nil, image_url: "http://graph.facebook.com/10205257482010199/pictur...", url: nil, otp_secret_key: nil, created_at: "2015-10-05 03:30:37", updated_at: "2015-10-05 03:32:13">

user = User.create(name:"ΜΔχ Πλισσκιν", email: "mmplisskin@gmail.com", admin: true )
