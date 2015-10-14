require 'rails_helper'

RSpec.describe SitesController, :type => :controller do

  before :each do
    @site1 = Site.create(name:"example site", url: "example.com"  )
    @site2 = Site.create(name:"example site 2", url: "example.com2")
  end

  describe "Site create" do
    describe "without valid log in" do
      it "sends user back to log in page" do
        (expect(response.status).to eq(200))
        end
    end
  end
end
