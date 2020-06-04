class MatchUpsController < ApplicationController
    def update
        #update round that was clicked on 
        mc = MatchUp.find(params[:id])
        mc.update(match_up_params)
        tournament = mc.round.tournament
        #this is the second round we need to update 
        next_round = tournament.rounds.find_by(round_number: (mc.round.round_number+1))
        if mc.match_up_number.odd?
            nr_mc_num = (mc.match_up_number + 1)/ 2
            next_match_up = next_round.match_ups.find_by(match_up_number: nr_mc_num)
            next_match_up.update(team_a_id: mc.winner_id)
        else 
            nr_mc_num = (mc.match_up_number/2)
            next_match_up = next_round.match_ups.find_by(match_up_number: nr_mc_num)
            next_match_up.update(team_b_id: mc.winner_id)
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
