class FollowersController < ApplicationController

    def create
        Follower.create(user_follower_id: params[:user_follower_id], tournament_followed_id: params[:tournament_followed_id])
        render json: Tournament.find(params[:tournament_followed_id])
    end
end
