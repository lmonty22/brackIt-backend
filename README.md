
# BrackIt - BackEnd

## Summary

This is a tournament bracket generater designed to allow users to generate and manage tournament BrackIts while their friends follow along. Users can create BrackIts with 4, 8, 16, 32 or 64 teams. Tournaments can be private (unsearchable) or public. First round matchups can be random by selecting 'shuffle teams' or the tournament creator can manually decide first round match ups when entering team names. You may record scores, advance teams and edit team names, and edit tournament details, throughout the Torurnament and finally crown a champion. 

Additional features allow you to search for (public) tournaments and follow tournaments. 

## Instructions

2. Run 
`bundle install`

3. Run
`rails db:migrate`

4. Run
`rails db:seed`

5. Run
`rails s`

6. Rails should now be running the api on http://localhost:3000. You can check the tournaments route going to http://localhost:3000/touranments in your browser.

5. Make sure to clone down the [Front-end Repo](https://github.com/lmonty22/brackIt-front-end/) and follow the front-end Readme instructions next! 


### need to include more... 

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
