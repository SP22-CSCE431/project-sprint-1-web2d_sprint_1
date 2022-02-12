# location: spec/feature/integration_spec.rb
require 'rails_helper'

RSpec.describe 'Creating a new user bio', type: :feature do
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