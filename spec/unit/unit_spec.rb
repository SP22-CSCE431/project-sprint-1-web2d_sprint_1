# location: spec/unit/unit_spec.rb
require 'rails_helper'

# User unit tests
RSpec.describe User, type: :model do
    subject do
      described_class.new(username: 'ben', password: 'password', email: 'ben@tamu.edu'
                        isAdmin: true, role: 'Officer', Bio: 'I\'m Ben')
    end
  
    # Sunny Day Cases
    it 'role is valid with valid attributes' do
      expect(role).to be_valid
    end

    it 'isAdmin is valid with valid attributes' do
        expect(isAdmin).to be_valid
    end
  
    # Rainy Day Cases
    it 'role is not valid without a name' do
      subject.role = nil
      expect(role).not_to be_valid
    end

    it 'isAdmin is not valid without a name' do
        subject.isAdmin = nil
        expect(isAdmin).not_to be_valid
      end
  end
  