class TournamentsController < ApplicationController
    def show
        t = Tournament.find(params[:id])
        render :json => t.as_json(include: {rounds: {
                                              include: {match_ups: {
                                                  include: [:team_a, :team_b]
                                              } } }
        })
    end

    def index
        t = Tournament.all 
        render :json => t.as_json(include: {rounds: {
                                              include: {match_ups: {
                                                  include: [:team_a, :team_b]
                                              } } }
        })
    end
end
