require 'rails_helper'

RSpec.describe "Nimbuses", type: :request do
  describe "GET /book" do
    it "returns http success" do
      get "/nimbus/book"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /house" do
    it "returns http success" do
      get "/nimbus/house"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /character" do
    it "returns http success" do
      get "/nimbus/character"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /spell" do
    it "returns http success" do
      get "/nimbus/spell"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #newbook" do
    it "returns http success" do
      get :home
      expect(response).to have_http_status(:success)
    end
  end


end
