class AuthController < ApplicationController
    def create
        user = User.find_by(username: params[:username])
        if(user && user.authenticate(params[:password]))
              payload = {user_id: user.id}
              token = encode(payload)
              tournaments_followed = user.tournament_followeds
              new_hash = {}
              new_hash["user_data"] = user
              new_hash["token"] = token
              new_hash['followed_tournaments'] = tournaments_followed
              render json: new_hash
         else
            #either the username wasn't found
            #or the password was inccorect
              render json: {
                error_message: "Incorrect username or password"
              }
         end
    end

    def relogin
      token = request.headers["Authenticate"]
      new_hash = {}
      user = User.find(decode(token)["user_id"])
      new_hash['user_data'] = user
      new_hash['followed_tournaments'] = user.tournament_followeds
      render json: new_hash
    end
end