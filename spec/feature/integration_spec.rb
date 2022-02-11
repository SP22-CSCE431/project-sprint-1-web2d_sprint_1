# location: spec/feature/integration_spec.rb
require 'rails_helper'

RSpec.describe 'Creating a user with valid attributes', type: :feature do
    scenario 'valid inputs' do
      visit new_user_path
      fill_in 'username', with: 'harry potter'
      fill_in 'email', with: 'britwiz@tamu.edu'
      fill_in 'bio', with: 'I am a wizard'
      fill_in 'role', with: 'wizard'
      click_on 'Create User'
      visit users_path
      expect(page).to have_content('wizard')
    end
  end