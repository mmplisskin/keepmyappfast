class Site < ActiveRecord::Base

  belongs_to :user

  validates :name, length: { in: 4..50 }
  validates :url, uniqueness: true, if: :format_url
  # calls valid url method to ensure domain
  validate :url, :valid_url
  # after_validation :format_url


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


  def worker_queue
    PingWorker.perform_async(self.id)
    # binding.pry
  end


end
