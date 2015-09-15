class Site < ActiveRecord::Base
  belongs_to :user
  validates :name, length: { in: 4..50 }
  validates :url, uniqueness: true
end
