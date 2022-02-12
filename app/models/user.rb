class User < ApplicationRecord
    validate :username
    validate :password
    validate :email
    validate :isAdmin
    validate :role
    validate :bio
    validate :portfolioID
end
