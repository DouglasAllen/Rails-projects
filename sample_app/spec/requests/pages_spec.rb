require 'spec_helper'

describe "Pages" do
  describe "GET /pages" do
    it "app\views\pages\home responce 200" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get pages_home_path
      response.status.should be(200)
    end

    it "app\views\pages\contact responce 200" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get pages_contact_path
      response.status.should be(200)
    end
  end  
  
end


