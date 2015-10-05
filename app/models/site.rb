class Site < ActiveRecord::Base

  belongs_to :user

  validates :name, length: { in: 4..50 }
  # uniqueness is checked after url is formatted
  validates :url, uniqueness: true, if: :format_url
  # calls valid url method to ensure domain
  validate :url, :valid_url
  # after_validation :format_url


# chomps input returns protocol if present or http:// + url
  def format_url
    self.url.chomp
    if self.url.match("https://") || self.url.match("http://")
    else self.url = "http://" + url
    end
    self.url
  end

  def valid_url
    # removes protocol and checks if suffix is valid
    unless PublicSuffix.valid?(url.sub(/^https?\:\/\//, '').sub(/^www./,''))
      errors.add(:url, "This doesn't appear to be an valid site.")
    end
  end

#adds site id to ping worker queue for async processing
  def worker_queue
    PingWorker.perform_async(self.id)
  end


end
