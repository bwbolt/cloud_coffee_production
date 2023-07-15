require "rails_helper"

RSpec.describe BlendsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/blends").to route_to("blends#index")
    end

    it "routes to #new" do
      expect(get: "/blends/new").to route_to("blends#new")
    end

    it "routes to #show" do
      expect(get: "/blends/1").to route_to("blends#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/blends/1/edit").to route_to("blends#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/blends").to route_to("blends#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/blends/1").to route_to("blends#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/blends/1").to route_to("blends#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/blends/1").to route_to("blends#destroy", id: "1")
    end
  end
end
