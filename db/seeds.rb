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
Follower.destroy_all 


linds = User.create(username: 'lmonty22', password: 'password')
mack = User.create(username: 'mack123', password: 'password')
mary = User.create(username: 'outdoorsyChick1', password: 'password')

t1 = Tournament.create(name: "Lindsay's Skee-ball Tourney", number_of_teams: 8, user_id: linds.id)
team_names = ['Lindsay', 'Mack', 'Jason', 'Danny', 'Sue', 'Greg', 'Chelsey', 'Elle']
teams = Team.create_teams(t1.number_of_teams, team_names)
t1.create_rounds(teams)

t2 = Tournament.create(name: "Mack's Cornhole Tourney", number_of_teams: 16, user_id: mack.id, public: false)
teams_names2 = ['Mack & Lindsay', 'Vicky & Mike', 'Hart & Nellie', 'Elle & Kelpie', 'Greg & Sue', 'Danny & Jason', 'Team 1', 'Team 2', 'Team 3', 'Team 4', 'Team 5', 'Team 6', 'Team 7', 'Team 8', 'Team 9', 'Team 10'].shuffle()
teams2 = Team.create_teams(t2.number_of_teams, teams_names2)
t2.create_rounds(teams2)

t3 = Tournament.create(name: "Hashbrowns Scribble.io", number_of_teams: 16, user_id: mary.id)
teams_names3 = ['Chine', 'Lindsay', 'Mary', 'Uzo', 'Bret', 'Junior', 'Danny', 'T', 'Alex', 'Carla', 'Beza', 'Deijah', 'Sebastian', 'Yari', 'Richard', 'Dawit'].shuffle()
teams3 = Team.create_teams(t3.number_of_teams, teams_names3)
t3.create_rounds(teams3)

t4 = Tournament.create(name: "Hashbrowns Ping Pong", number_of_teams: 16, user_id: mary.id)
teams_names4 = ['Chine', 'Lindsay', 'Mary', 'Uzo', 'Bret', 'Junior', 'Danny', 'T', 'Alex', 'Carla', 'Beza', 'Deijah', 'Sebastian', 'Yari', 'Richard', 'Dawit'].shuffle()
teams4 = Team.create_teams(t4.number_of_teams, teams_names4)
t4.create_rounds(teams4)

mf = Follower.create(user_follower_id: mack.id, tournament_followed_id: t1.id)
lf = Follower.create(user_follower_id: linds.id, tournament_followed_id: t3.id)



# teams = [team1, team2, team3, team4, team5, team6, team7, team8]
