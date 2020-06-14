class TournamentsController < ApplicationController
    def show
        t = Tournament.find(params[:id])
        render :json => t.as_json(include: [:champion, :user, {rounds: {
                                              include: {match_ups: {
                                                  include: [:team_a, :team_b]
                                              } } }
        }])
    end

    def index
        t = Tournament.all 
        render :json => t.as_json(include: [:champion, :user])
    end

    def create
        t = Tournament.create(name: params[:name], number_of_teams: params[:numberOfTeams], user_id: params[:user_id], public: !params[:private])
        team_names = params[:teamNames]
        if params[:shuffle]
            team_names = team_names.shuffle()
        end
        teams = Team.create_teams(params[:numberOfTeams], team_names)
        t.create_rounds(teams)
        render :json => t.as_json(include: [:champion, :user])
            # maybe render this one if I force a redirect? 

        # render :json => t.as_json(include: [:champion, :user, {rounds: {
        #                                       include: {match_ups: {
        #                                           include: [:team_a, :team_b]
        #                                       } } }
        # }])
    end

    def destroy
        t = Tournament.find(params[:id])
        mc = t.rounds.map do | r |
            r.match_ups
        end
        MatchUp.delete(mc)
        Round.delete(t.rounds)
        t.destroy()
    end

    
end
