require 'rails_helper'

RSpec.describe TinyUrl, :type => :model do
  it "validates url" do
    url = TinyUrl.new :url => "http://"
    expect(url.valid?).to be false
    url = TinyUrl.new :url => "some"
    expect(url.valid?).to be false
    url = TinyUrl.new :url => "http://ah"
    expect(url.valid?).to be true
  end

  it "sets tinyurl" do
    url = TinyUrl.create! :url => "http://domain"
    expect(url.tiny_path).to be 
    url.reload
    # should be tiny
    expect(url.tiny_path.size < 6).to be true
  end

  it "avoids collisions" do
    url1 = TinyUrl.create! :url => "http://domain"
    url2 = TinyUrl.create! :url => "http://domain"
    expect(url1.tiny_path).to_not eq(url2.tiny_path)
  end
end
