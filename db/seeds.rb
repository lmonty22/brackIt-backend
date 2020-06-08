# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Tournament.destroy_all
Round.destroy_all
MatchUp.destroy_all
Team.destroy_all
User.destroy_all

linds = User.create(username: 'lmonty22', password: 'password')
mack = User.create(username: 'mack123', password: 'password')

t1 = Tournament.create(name: 'my awesome first tourney', number_of_teams: 8, user_id: linds.id)
round1 = Round.create(tournament_id: t1.id, round_number: 1)
round2 = Round.create(tournament_id: t1.id, round_number: 2)
round3 = Round.create(tournament_id: t1.id, round_number: 3)

team1 = Team.create(name: 'team1')
team2 = Team.create(name: 'team2')
team3 = Team.create(name: 'team3')
team4 = Team.create(name: 'team4')
team5 = Team.create(name: 'team5')
team6 = Team.create(name: 'team6')
team7 = Team.create(name: 'team7')

team8 = Team.create(name: 'team8')

m1r1 =MatchUp.create(round_id: round1.id, match_up_number: 1, team_a_id: team1.id, team_b_id: team2.id)
m2r1 =MatchUp.create(round_id: round1.id, match_up_number: 2, team_a_id: team3.id, team_b_id: team4.id)
m3r1 =MatchUp.create(round_id: round1.id, match_up_number: 3, team_a_id: team5.id, team_b_id: team6.id)
m4r1 =MatchUp.create(round_id: round1.id, match_up_number: 4, team_a_id: team7.id, team_b_id: team8.id)

m1r2 = MatchUp.create(round_id: round2.id, match_up_number: 1)
m2r2 = MatchUp.create(round_id: round2.id, match_up_number: 2)

m1r3 = MatchUp.create(round_id: round3.id, match_up_number: 1)

# teams = [team1, team2, team3, team4, team5, team6, team7, team8]
