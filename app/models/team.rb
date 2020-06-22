class Team < ApplicationRecord

    #create all teamms based on a array of team Names
    def self.create_teams(number_of_teams, teamNames)
        array_of_teams = []
        teamNames.each do |t| 
            newTeam = Team.create(name: t)
            array_of_teams.push(newTeam)
        end 
        array_of_teams
    end

end
