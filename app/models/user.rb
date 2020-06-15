class User < ApplicationRecord
    has_secure_password
    has_many :tournaments
    has_many :followers, :foreign_key => "user_follower_id"
    has_many :tournament_followeds, through: :followers
    validates :username, uniqueness: true
end