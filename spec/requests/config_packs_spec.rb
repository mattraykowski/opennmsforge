require 'spec_helper'

describe "ConfigPacks" do
  describe "GET /config_packs" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get config_packs_path
      response.status.should be(200)
    end
  end
end
