
require "rails_helper"


RSpec.describe Tournament, :type => :model do
    it 'belongs to a user' do
        user1 = User.create(username: 'lpm22', password: 'password')
        t = Tournament.create(name: 'best tourney ever', user_id: user1.id)
        expect(t.user).to eq(user1)
    end

    it 'can set a champion' do 
        team = Team.create(name: 'winning team')
        user2 = User.create(username: 'lpm1', password: 'password')
        t = Tournament.create(name: 'tournament with a champion', user_id: user2.id )
        t.setChampion(team.id)
        expect(t.champion).to eq(team)
    end

    it 'can create rounds and matchups' do 
        team_names = ['Mack', 'Lindsay', 'Mary', 'Danny']
        teams = Team.create_teams(4, team_names)
        user3 = User.create(username: 'outdoorseyChick', password: 'password')
        t = Tournament.create(name: 'tournament with rounds and matchups', user_id: user3.id, number_of_teams: 4)
        t.create_rounds(teams)
        expect(t.rounds.length).to eq(2)
        expect(t.rounds.find_by(round_number: 1).match_ups.length).to eq(2)
        expect(t.rounds.find_by(round_number: 2).match_ups.length).to eq(1)
    end


end