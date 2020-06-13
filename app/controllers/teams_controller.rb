class TeamsController < ApplicationController

    def update
        team = Team.find(params[:id])
        team.update(name: params[:name])
        tournament = Tournament.find(params[:tournament])
        render :json => tournament.as_json(include: [:champion, :user, {rounds: {
            include: {match_ups: {
                include: [:team_a, :team_b]
            } } }
            }])
    end
end
