require 'spec_helper'

describe "Sentences" do
  describe "GET /sentences" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get sentences_path
      response.status.should be(200)
    end
  end
end
