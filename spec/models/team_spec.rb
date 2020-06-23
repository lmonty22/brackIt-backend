require "rails_helper"

RSpec.describe Team, :type => :model do

    it 'can create teams ' do 
        team_names = ['Mack', 'Lindsay', 'Mary', 'Danny']
        teams = Team.create_teams(4, team_names)
        expect(teams.length).to eq(4)
    end

end