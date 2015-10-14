require 'rails_helper'
require 'sidekiq/testing'
Sidekiq::Testing.fake!

RSpec.describe Site, type: :model do


  it "is invalid without a name" do
    site = Site.new(name: nil, url: "example.com")
    expect(site).to be_invalid
	end

  it "is invalid without a name of that is 4 - 50 characters" do
    site = Site.new(name: "exa", url: "example.com")
    expect(site).to be_invalid
	end

  it "is invalid without a valid url" do
    site2 = Site.new(name: nil, url: "example.z")
    expect(site2).to be_invalid
  end

  it "is valid with a name and valid url" do
    site = Site.new(name: "hello", url: "example.com")
    expect(site).to be_valid
	end

  it "preserves protocol of url if protocol exists" do
    site = Site.create(name: "hello", url: "https://example.com")
    expect(site.url).to eq("https://example.com")
    site2 = Site.create(name: "hello", url: "http://example2.com")
    expect(site2.url).to eq("http://example2.com")
	end

  it "adds protocol if none exists on create" do
    site = Site.create(name: "hello", url: "example.com")
    expect(site.url).to eq("http://example.com")
	end


  it "is invalid if not a unique url" do
    site = Site.create(name: "hello", url: "example.com")
    expect(site).to be_valid
    site2 = Site.create(name: "hello", url: "example.com")
    expect(site2).to be_invalid
	end


  it "is invalid if it does not end with a suffix" do
    site = Site.create(name: "hello", url: "example.com/")
    expect(site).to be_invalid
	end

  # it "is invalid if not a unique url" do
  #   expect {
  #     PingWorker.perform_async(1, 2)
  #   }.to change(PingWorker.jobs, :size).by(1)
  # end







end
