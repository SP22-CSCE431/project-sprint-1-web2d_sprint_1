# location: spec/feature/integration_spec.rb
require 'rails_helper'
require 'omniauth'

RSpec.describe 'Creating a user with valid attributes', type: :feature do
    before(:each) do
      Rails.application.env_config["devise.mapping"] = Devise.mappings[:user]
      Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:google_oauth2]
      visit root_path
      click_link "Sign in with Google"
    end
    scenario 'valid inputs' do
      visit new_user_path
      fill_in 'user_username', with: 'harry potter'
      fill_in 'user_email', with: 'britwiz@tamu.edu'
      fill_in 'user_bio', with: 'I am a wizard'
      fill_in 'user_role', with: 'wizard'
      click_on 'Create User'
      visit users_path
      expect(page).to have_content('wizard')
    end
    scenario 'invalid name' do
      visit new_user_path
      fill_in 'user_username', with: ''
      fill_in 'user_email', with: 'britwiz@tamu.edu'
      fill_in 'user_bio', with: 'I am a wizard'
      fill_in 'user_role', with: 'wizard'
      click_on 'Create User'
      visit users_path
      expect(page).not_to have_content('britwiz@tamu.edu')
      expect(page).not_to have_content('wizard')
    end
    scenario 'invalid email' do
      visit new_user_path
      fill_in 'user_username', with: 'harry potter'
      fill_in 'user_email', with: ''
      fill_in 'user_bio', with: 'I am a wizard'
      fill_in 'user_role', with: 'wizard'
      click_on 'Create User'
      visit users_path
      expect(page).not_to have_content('harry potter')
      expect(page).not_to have_content('wizard')
    end
    scenario 'invalid name' do
      visit new_user_path
      fill_in 'user_username', with: 'harry potter'
      fill_in 'user_email', with: 'britwiz@tamu.edu'
      fill_in 'user_bio', with: ''
      fill_in 'user_role', with: 'wizard'
      click_on 'Create User'
      visit users_path
      expect(page).not_to have_content('harry potter')
      expect(page).not_to have_content('wizard')
    end
    scenario 'invalid name' do
      visit new_user_path
      fill_in 'user_username', with: 'harry potter'
      fill_in 'user_email', with: 'britwiz@tamu.edu'
      fill_in 'user_bio', with: 'I am a wizard'
      fill_in 'user_role', with: ''
      click_on 'Create User'
      visit users_path
      expect(page).not_to have_content('harry potter')
      expect(page).not_to have_content('britwiz@tamu.edu')
    end
  end
#ALL TESTS SHOULD BE PLACED ABOVE THIS ONE
#Otherwise, they will not work
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

