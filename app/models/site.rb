class Site < ActiveRecord::Base
  belongs_to :user
  validates :name, length: { in: 4..50 }
  validates :url, uniqueness: true

  def check_url(url)

      if url.match("https://")
      else
        url = "http://" + url
      end
      url = url.chomp
      url
  end

end
