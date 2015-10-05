#Keep My App Fast [![Build Status](https://travis-ci.org/mmplisskin/keepmyappfast.svg?branch=testing)](https://travis-ci.org/mmplisskin/keepmyappfast)


##setup
####There are a few dependincies for the development environemnt including postgress, redis and sidekiq.
####Clockwork is included but not required unless you want to see jobs added to the queue every 20 minutes


`bundle`

`rake db:setup`

###launch redis
`redis-server`
###start sidekiq
`bundle exeq sidekiq`


###launch clockwork (optional)
`bundle exec clockwork app/clock.rb`



App is at localhost:3000/sidekiq
Queue can be seen at localhost:3000/sidekiq
