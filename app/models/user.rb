class User < ApplicationRecord
    has_secure_password
    has_many :tournaments
    has_many :tournament_followers, :foreign_key => "follower_id"
    has_many :tournament_followeds, through: :tournament_followers
    validates :username, uniqueness: true
end