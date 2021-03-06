class UsersController < ApplicationController
    def index 
        render json: User.all
    end

    def create
        user = User.create(username: params[:username], password: params[:password])
        payload = {user_id: user.id}
        token = encode(payload)
        new_hash = {}
        new_hash["user_data"] = user.as_json(include: 
            {followers: {include:
                {tournament_followed: {
                    include: [:user, :champion]
            }}}})
        new_hash["token"] = token
        render json: new_hash
    end
end
