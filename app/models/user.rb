class User < ApplicationRecord
    validate :role, :isAdmin, :username, :password, :email, :bio, :portfolioID
end
