class User < ApplicationRecord
    validate :role
end
