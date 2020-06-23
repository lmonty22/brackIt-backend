require "rails_helper"

RSpec.describe Round, :type => :model do

    it 'can create match ups ' do 
        team_names = ['Mack', 'Lindsay', 'Mary', 'Danny']
        teams = Team.create_teams(4, team_names)
        user3 = User.create(username: 'outdoorseyChick', password: 'password')
        t = Tournament.create(name: 'tournament with rounds and matchups', user_id: user3.id, number_of_teams: 4)
        r1= Round.create(tournament_id: t.id, round_number: 1)
        r2 = Round.create(tournament_id: t.id, round_number: 2)
        r1.create_match_ups(teams)
        r2.create_match_ups(teams)
        expect(r1.match_ups.length).to eq(2)
        expect(r2.match_ups.length).to eq(1)
    end

    it 'belongs to a tournament' do 
        user3 = User.create(username: 'outdoorseyChick', password: 'password')
        t = Tournament.create(name: 'tournament with rounds and matchups', user_id: user3.id, number_of_teams: 4)
        r1= Round.create(tournament_id: t.id, round_number: 1)
        expect(r1.tournament).to eq(t)
    end

end