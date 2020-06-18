class AuthController < ApplicationController
    def create
        user = User.find_by(username: params[:username])
        if(user && user.authenticate(params[:password]))
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
      user = User.find(decode(token)["user_id"]) 
      render json: user.as_json(include: 
        {followers: {include:
            {tournament_followed: {
              include: [:user, :champion]
        }}}})
  
    end
end