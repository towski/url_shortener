require 'rails_helper'

RSpec.describe TinyUrlsController, :type => :controller do
  it "has a new form" do
    get :new
    expect(response.status).to be 200
  end

  it "shows the url" do
    url = TinyUrl.create! :url => "http://example.com"
    get :show, :id => url.id
    expect(response.status).to be 200
  end

  it "redirects by id" do
    url = TinyUrl.create! :url => "http://example.com"
    get :redirect, :id => url.tiny_path
    expect(response.status).to be 302
  end

  it "redirects if id not found" do
    url = TinyUrl.create! :url => "http://example.com"
    get :redirect, :id => "not"
    expect(response.status).to be 302
  end

  it "handles bad id" do
    url = TinyUrl.create! :url => "http://example.com"
    get :show, :id => "not"
    expect(response.status).to be 200
  end

  it "creates the tiny_url" do
    post :create, :tiny_url => {:url => "http://example.com"}
    expect(response.status).to be 302
  end

  it "fails to create bad urls" do
    post :create, :tiny_url => {:url => "http://"}
    expect(response.status).to be 200
  end
end
