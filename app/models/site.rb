class Site < ActiveRecord::Base
  belongs_to :user
  validates :name, length: { in: 4..50 }
  validates :url, uniqueness: true
  # validates :url, :presence => true, :url => true

  def format_url(url)
      url = url.chomp
      if url.match("https://")
        elsif url.match("http://")
        else url = "http://" + url
      end
      url
  end

  def valid_url(url)
    PublicSuffix.valid?(url.sub(/^https?\:\/\//, '').sub(/^www./,''))
  end


end
