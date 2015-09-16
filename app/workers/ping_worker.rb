class PingWorker

  include Sidekiq::Worker
  include HTTParty
  HTTParty::Basement.default_options.update(verify: false)
  sidekiq_options :retry => 1

  def perform(site_id)


    site = Site.find(site_id)
    response = HTTParty.get(site.url)

    if response.code == 200
      site.status = "Good To Go"

    elsif response.code >= 300 && response.code < 400
      site.status = "Redirected Somewhere"

    else
      site.status = "Something is Wrong :( "
    end

    site.last_checked = Time.now
    site.save!
  end

end
