class User < ApplicationRecord
    has_secure_password
    has_many :tournaments
    validates :username, uniqueness: true
end