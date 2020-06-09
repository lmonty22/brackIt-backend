class MatchUpsController < ApplicationController
    def update
        #update round that was clicked on 
        mc = MatchUp.find(params[:id])
        mc.update(match_up_params)
        #find and update the next matchup 
        mc.findNextLevel
        tournament = mc.round.tournament
        render :json => tournament.as_json(include: [:champion, :user, {rounds: {
                                              include: {match_ups: {
                                                  include: [:team_a, :team_b]
                                              } } }
        }])
    end

    private
    def match_up_params
        params.require(:match_up).permit(:team_a_id, :team_b_id, :winner_id)
    end
end
