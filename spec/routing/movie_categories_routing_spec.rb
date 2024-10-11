require "rails_helper"

RSpec.describe MovieCategoriesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/movie_categories").to route_to("movie_categories#index")
    end

    it "routes to #show" do
      expect(get: "/movie_categories/1").to route_to("movie_categories#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/movie_categories").to route_to("movie_categories#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/movie_categories/1").to route_to("movie_categories#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/movie_categories/1").to route_to("movie_categories#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/movie_categories/1").to route_to("movie_categories#destroy", id: "1")
    end
  end
end
