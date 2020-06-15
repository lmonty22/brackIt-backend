class MatchUpsController < ApplicationController
    def update
        #update round that was clicked on 
        mc = MatchUp.find(params[:id])
        mc.update(match_up_params)
        #find and update the next matchup 
        if mc.winner_id 
            mc.findNextLevel
        end
        tournament = mc.round.tournament
        render :json => tournament.as_json(include: [:champion, :user, {rounds: {
                                              include: {match_ups: {
                                                  include: [:team_a, :team_b]
                                              } } }
        }])
    end

    def remove
        mc = MatchUp.find(params[:id])
        mc.remove_from_matchup(params[:team_slot])
        tournament = Tournament.find(params[:tournament_id])
        render :json => tournament.as_json(include: [:champion, :user, {rounds: {
            include: {match_ups: {
                include: [:team_a, :team_b]
            } } }
        }])
    end

    private
    def match_up_params
        params.require(:match_up).permit(:team_a_id, :team_b_id, :winner_id, :team_a_score, :team_b_score)
    end
end
