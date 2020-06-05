class Team < ApplicationRecord
    # has_many :match_ups
    def self.create_teams(number_of_teams, teamNames)
        array_of_teams = []
        extra_teams = number_of_teams - teamNames.length
        x = 1 
        extra_teams.times do 
            t = Team.create(name: "Team #{x}")
            array_of_teams.push(t)
            x+= 1
        end
        teamNames.each do |t| 
            newTeam = Team.create(name: t)
            array_of_teams.push(newTeam)
        end 
        array_of_teams
    end


end
