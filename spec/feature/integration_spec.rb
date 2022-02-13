# location: spec/feature/integration_spec.rb
require 'rails_helper'
require 'omniauth'

RSpec.describe 'Logging In and Logging Out', type: :feature do
    before(:each) do
      Rails.application.env_config["devise.mapping"] = Devise.mappings[:user] # If using Devise
      Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:google_oauth2]
    end
    scenario 'valid inputs' do
      visit root_path
      click_link "Sign in with Google"
      expect(page).to have_content('You\'re logged in!')
      click_link "Sign Out"
      expect(page).to have_content("You\'re Logged out!")
    end
    scenario 'invalid login' do
      OmniAuth.config.mock_auth[:google_oauth2] = :invalid_credentials
      visit root_path
      click_link "Sign in with Google"
      expect(page).not_to have_content('You\'re logged in!')
    end
  end