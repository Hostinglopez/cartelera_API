require "rails_helper"

RSpec.describe SumariesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/sumaries").to route_to("sumaries#index")
    end

    it "routes to #show" do
      expect(get: "/sumaries/1").to route_to("sumaries#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/sumaries").to route_to("sumaries#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/sumaries/1").to route_to("sumaries#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/sumaries/1").to route_to("sumaries#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/sumaries/1").to route_to("sumaries#destroy", id: "1")
    end
  end
end
