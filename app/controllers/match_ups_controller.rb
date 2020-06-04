class MatchUpsController < ApplicationController
    def update
        #update round that was clicked on 
        mc = MatchUp.find(params[:id])
        mc.update(match_up_params)
        tournament = mc.round.tournament

        #this is the second round we need to update 
        level_up_round = tournament.rounds.find_by(round_number: (mc.round.round_number+1))
        level_up_match_up_number = mc.match_up_number.odd?? (mc.match_up_number + 1)/2 : mc.match_up_number/2 
        level_up_match_up = level_up_round.match_ups.find {|m|  m.match_up_number == level_up_match_up_number}

            if mc.match_up_number.odd?
                level_up_match_up.update(team_a_id: mc.winner_id)
            else 
                level_up_match_up.update(team_b_id: mc.winner_id)
            end
        render :json => tournament.as_json(include: {rounds: {
            include: {match_ups: {
                include: [:team_a, :team_b]
            } } }})
    end

    private
    def match_up_params
        params.require(:match_up).permit(:team_a_id, :team_b_id, :winner_id)
    end
end
