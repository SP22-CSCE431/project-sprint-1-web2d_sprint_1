# location: spec/feature/integration_spec.rb
require 'rails_helper'
require 'omniauth'

RSpec.describe 'Creating a new user bio', type: :feature do
    before(:each) do
      Rails.application.env_config["devise.mapping"] = Devise.mappings[:user]
      Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:google_oauth2]
      visit root_path
      click_link "Sign in with Google"
    end
    scenario 'valid inputs' do
      visit new_user_path
      fill_in 'username', with: 'Froggers', visible: false
      fill_in 'password', with: '12345', visible: false
      fill_in 'email', with: 'gmail@gmail.com', visible: false
      fill_in 'isAdmin',  with: 'False'
      fill_in 'portfolioID', with: '1'
      click_on 'Create User'
      visit users_path
      expect(page).to have_content('')
    end
end

RSpec.describe 'Editing a user bio', type: :feature do
    before(:each) do
      Rails.application.env_config["devise.mapping"] = Devise.mappings[:user]
      Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:google_oauth2]
      visit root_path
      click_link "Sign in with Google"
    end
    scenario 'valid inputs' do
      tempUser = User.create!(username: 'Froggers', password: '12345', email: 'gmail@gmail.com', isAdmin: 'False', role: 'Member', bio: 'I am a frog', portfolioID: '1')
      visit edit_user_path(tempUser)
      fill_in 'bio', with: 'I like to draw', visible: false
      click_on 'Update User'
      visit users_path
      expect(page).to have_content('I like to draw')
    end
end

RSpec.describe 'Editing a user bio to be blank', type: :feature do
    before(:each) do
      Rails.application.env_config["devise.mapping"] = Devise.mappings[:user]
      Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:google_oauth2]
      visit root_path
      click_link "Sign in with Google"
    end
    scenario 'valid inputs' do
      tempUser = User.create!(username: 'Froggers', password: '12345', email: 'gmail@gmail.com', isAdmin: 'False', role: 'Member', bio: 'I am a frog', portfolioID: '1')
      visit edit_user_path(tempUser)
      fill_in 'bio', with: '', visible: false
      click_on 'Update User'
      visit users_path
      expect(page).to have_content('')
    end
end

RSpec.describe 'Editing a user', type: :feature do
    before(:each) do
      Rails.application.env_config["devise.mapping"] = Devise.mappings[:user]
      Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:google_oauth2]
      visit root_path
      click_link "Sign in with Google"
    end
    scenario 'valid inputs' do
      tempUser = User.create!(username: 'Froggers', password: '12345', email: 'gmail@gmail.com', isAdmin: 'False', role: 'Member', bio: 'I am a frog', portfolioID: '1')
      visit edit_user_path(tempUser)
      fill_in 'username', with: 'Doggers', visible: false
      fill_in 'password', with: '54321', visible: false
      fill_in 'email', with: 'dog@dog.com', visible: false
      fill_in 'isAdmin', with: 'True', visible: false
      fill_in 'role', with: 'Officer', visible: false
      fill_in 'bio', with: 'I like to draw', visible: false
      fill_in 'portfolioID', with: '2', visible: false
      click_on 'Update User'
      visit users_path
      expect(page).to have_content('Doggers')
      expect(page).to have_content('54321')
      expect(page).to have_content('dog@dog.com')
      expect(page).to have_content('True')
      expect(page).to have_content('Officer')
      expect(page).to have_content('I like to draw')
      expect(page).to have_content('2')
    end
end

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