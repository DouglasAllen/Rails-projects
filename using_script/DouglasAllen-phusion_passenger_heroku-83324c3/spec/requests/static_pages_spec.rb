require 'spec_helper'

# TDD 3.2.1
# > rails generate integration_test static_pages
# Generated code via rails generate integration_test static_pages
#describe "StaticPages" do
#  describe "GET /static_pages" do
#    it "works! (now write some real specs)" do
#      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
#      get static_pages_index_path
#      response.status.should be(200)
#    end
#  end
#end

# Listing 3.9.
# Modified for our tests.
#describe "Static pages" do

#  describe "Home page" do
#    it "should have the content 'Sample App'" do
#      visit '/static_pages/home'
#      page.should have_content('Sample App')
#    end
#  end

# Listing 3.11.

#describe "Static pages" do

#  describe "Home page" do
#    it "should have the content 'Sample App'" do
#      visit '/static_pages/home'
#      page.should have_content('Sample App')
#    end
#  end
#  
#  describe "Help page" do
#    it "should have the content 'Help'" do
#      visit '/static_pages/help'
#      page.should have_content('Help')
#    end
#  end
#end

# Listing 3.13.
  
#describe "Static pages" do

#  describe "Home page" do

#    it "should have the content 'Sample App'" do
#      visit '/static_pages/home'
#      page.should have_content('Sample App')
#    end
#  end

#  describe "Help page" do

#    it "should have the content 'Help'" do
#      visit '/static_pages/help'
#      page.should have_content('Help')
#    end
#  end

#  describe "About page" do

#    it "should have the content 'About Us'" do
#      visit '/static_pages/about'
#      page.should have_content('About Us')
#    end
#  end
#end

# Listing 3.18.

describe "Static pages" do

  let(:base_title) { "Ruby on Rails Tutorial Sample App" }

  describe "Home page" do

    it "should have the h1 'Sample App'" do
      visit '/static_pages/home'
      page.should have_selector('h1', :text => 'Sample App')
    end

    it "should have the title 'Home'" do
      visit '/static_pages/home'
      page.should have_selector('title',
                        :text => "Home | #{base_title}")
    end
  end

  describe "Help page" do

    it "should have the h1 'Help'" do
      visit '/static_pages/help'
      page.should have_selector('h1', :text => 'Help')
    end

    it "should have the title 'Help'" do
      visit '/static_pages/help'
      page.should have_selector('title',
                        :text => "Help | #{base_title}")
    end
  end

  describe "About page" do

    it "should have the h1 'About Us'" do
      visit '/static_pages/about'
      page.should have_selector('h1', :text => 'About Us')
    end

    it "should have the title 'About'" do
      visit '/static_pages/about'
      page.should have_selector('title',
                    :text => "About | #{base_title}")
    end
  end
  
  describe "Contact page" do

    it "should have the h1 'Contact'" do
      visit '/static_pages/contact'
      page.should have_selector('h1', :text => 'Contact')
    end

    it "should have the title 'Contact'" do
      visit '/static_pages/contact'
      page.should have_selector('title', :text => "Contact | #{base_title}")
    end
  end
end
