namespace :ping do
  desc "Gets db of sites and pings them"

  task :sites => :environment do

    puts "*****==== getting a list of sites =====*****"
      #do not touch this line or add space it wont work if u add space
      sites_pinged = []
      sites = Site.all
      sites.each do |site|
        PingWorker.perform_async(site.id)
        sites_pinged << site.url
      end
      p sites_pinged
  end
  puts "$%$%$%$%$%$% ALL USERS HAVE BEEN ACCOUNTED FOR $%$%$%$%$%$%"
end
