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
        t = Tournament.create(tournament_params)
        team_names = params[:team_names]
        if params[:shuffle]
            team_names = team_names.shuffle()
        end
        teams = Team.create_teams(params[:number_of_teams], team_names)
        t.create_rounds(teams)
        render :json => t.as_json(include: [:champion, :user])
         # maybe render this one if I force a redirect? 
        # render :json => t.as_json(include: [:champion, :user, {rounds: {
        #                                       include: {match_ups: {
        #                                           include: [:team_a, :team_b]
        #                                       } } }
        # }])
    end

    def update
        t = Tournament.find(params[:id])
        t.update(tournament_params)
        render :json => t.as_json(include: [:champion, :user, {rounds: {
            include: {match_ups: {
                include: [:team_a, :team_b]
            } } }
        }])
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

    private

    def tournament_params
        params.require(:tournament).permit(:name, :number_of_teams, :user_id, :public)
    end

    
end
