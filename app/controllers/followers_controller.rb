class FollowersController < ApplicationController

    def create
        follow = Follower.create(user_follower_id: params[:user_follower_id], tournament_followed_id: params[:tournament_followed_id])
        render json: follow.as_json(include: {
            tournament_followed: {
                include: :user
            }
        })
    end

    def destroy
        follow = Follower.find(params[:id])
        follow.destroy
    end
end
