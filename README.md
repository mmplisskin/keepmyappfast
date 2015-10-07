#Keep My App Fast [![Build Status](https://travis-ci.org/mmplisskin/keepmyappfast.svg?branch=testing)](https://travis-ci.org/mmplisskin/keepmyappfast)



##To Do
* Render sites view in realtime
* Rspec Tests
* Refactoring


##setup
####There are a few dependencies for the development environment including postgress, redis and sidekiq.
####Clockwork is included but not required unless you want to see jobs added to the queue every 20 minutes


`bundle`

`rake db:setup`

###launch redis
`redis-server`
###start sidekiq
`bundle exeq sidekiq`


###launch clockwork (optional)
`bundle exec clockwork app/clock.rb`




Queue can be seen at .../sidekiq
