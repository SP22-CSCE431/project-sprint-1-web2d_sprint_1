class User < ApplicationRecord
    validates :role, presence: true
    validates :username, presence: true 
    validates :email, presence: true
    validates :bio, presence: true

    validate :isAdmin
    validate :password
    scope :officers, -> { where(isAdmin: true)}
end
