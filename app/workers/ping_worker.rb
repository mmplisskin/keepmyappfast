class PingWorker


  # including worker and httparty
  include Sidekiq::Worker
  include HTTParty
  #remove ssl cert validation
  HTTParty::Basement.default_options.update(verify: false)
  #do not retry failed jobs
  sidekiq_options :retry => 1

  def perform(site_id)
    #find site with active record and call it
    site = Site.find(site_id)
    response = HTTParty.get(site.url)
    #get http status code
    if response.code == 200
      site.status = "Good To Go"
    elsif response.code >= 300 && response.code < 400
      site.status = "Redirected Somewhere"
    else
      site.status = "Something is Wrong :( "
    #if site is down and we havent emailed you for 4 hours send an email
      if site.last_emailed < (4.hours.ago)
        UserMailer.delay.notify(site_id)
      end
      #set last email time to now
      site.last_emailed = Time.now
    end
    #set last checked time and update db
    site.last_checked = Time.now
    site.save!
  end
end
