class MatchUpsController < ApplicationController
    def update
        #update round that was clicked on 
        mc = MatchUp.find(params[:id])
        mc.update(match_up_params)
        if mc.winner_id 
            #find and update the next matchup with new team 
            mc.findNextLevel
        end
        tournament = mc.round.tournament
        #return the whole nested tournament to replace it in store since two matchups are being updated 
        render :json => tournament.as_json(include: [:champion, :user, {rounds: {
                                              include: {match_ups: {
                                                  include: [:team_a, :team_b]
                                              } } }
        }])
    end

    def remove
        mc = MatchUp.find(params[:id])
        #remove team from matchup and remove winner of previous matchup 
        mc.remove_from_matchup(params[:team_slot])
        tournament = Tournament.find(params[:tournament_id])
         #return the whole nested tournament to replace it in store since two matchups are being updated 
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
