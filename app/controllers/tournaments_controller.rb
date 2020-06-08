class TournamentsController < ApplicationController
    def show
        t = Tournament.find(params[:id])
        render :json => t.as_json(include: [:champion, {rounds: {
                                              include: {match_ups: {
                                                  include: [:team_a, :team_b]
                                              } } }
        }])
    end

    def index
        t = Tournament.all 
        render :json => t.as_json(include: [:champion, {rounds: {
                                              include: {match_ups: {
                                                  include: [:team_a, :team_b]
                                              } } }
        }])
    end

    def create
        t = Tournament.create(name: params[:name], number_of_teams: params[:numberOfTeams], user_id: params[:user_id])
        teams = Team.create_teams(params[:numberOfTeams], params[:teamNames])
        t.create_rounds(teams)
        render :json => t.as_json(include: [:champion, {rounds: {
                                              include: {match_ups: {
                                                  include: [:team_a, :team_b]
                                              } } }
        }])
    end

    
end
