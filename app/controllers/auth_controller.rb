class AuthController < ApplicationController
    def create
        #login
        user = User.find_by(username: params[:username])
        #uathenticate with bcrypt password_digest
        if(user && user.authenticate(params[:password]))
              payload = {user_id: user.id}
              #encode is in application controller
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
      #relogin, find user based on token
      #decode is located in application controller
      token = request.headers["Authenticate"]
      user = User.find(decode(token)["user_id"]) 
      render json: user.as_json(include: 
        {followers: {include:
            {tournament_followed: {
              include: [:user, :champion]
        }}}})
  
    end
end