class FollowersController < ApplicationController

    def create
        follow = Follower.create(follow_params)
        render json: follow.as_json(include: {
            tournament_followed: {
                include: [:user, :champion]
            }
        })
    end

    def destroy
        follow = Follower.find(params[:id])
        follow.destroy
    end

    private

    def follow_params
        params.require(:follower).permit(:tournament_followed_id, :user_follower_id)
    end
end
