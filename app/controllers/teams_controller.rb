class TeamsController < ApplicationController

    def update
        team = Team.find(params[:id])
        team.update(team_params)
        tournament = Tournament.find(params[:tournament])
        #return whole nested tournament becuase the team name can be in multiple locations 
        render :json => tournament.as_json(include: [:champion, :user, {rounds: {
            include: {match_ups: {
                include: [:team_a, :team_b]
            } } }
            }])
    end

    private

    def team_params
        params.require(:team).permit(:name)
    end
end
