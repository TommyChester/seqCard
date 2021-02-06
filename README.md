# README

#Goal

#About
##Theory
1. My goal is to make a deliverable product, I would rather a working product that does very little than a sketchy product that is feature rich. With that said I am building for heroku. 
2. It is almost always best to use what others have built if at all possible (particularly if it is either wwidely open source and checked or backed by SLA). With that said I rails new and rails -g scaffolds to build out. 
3. Though I believe that a front end is super important, I am going to start with entirely functionality before moving onto design. Though this is not the ideal workflow from true business perspective for the purposes of showing my skills I am going to start with this. 
4. The balance should say the same unless there is change in charges, so I am storing a value that gets updated based on the update time of the charge. 
5. I want a stood up front end without needing to injest json (I could do that later), so I am going to make multiple routes, one for html one for json. That means within my structure I am going to have 6 Routes for now. 


##Future Ideas
1. I am not going to put a UUID on each card but in the future I would use a UUID that is actual primary key and use the ID as secondary key that would be the public displayed ID. 
2. Add payments.

#How to Launch

#Captain Logs
1. Started a new rails application.
2. Switched to Posgres since I knew Sqlite3 (for a database) was not going to work on heroku (prior experience).
3. Scaffold out card .
4. Migrate and deploy to heroku.
5. Issue with the migration to heroku that was taken care of. 
6. Made the cards page the root. 
7. Just realized I should store the charges when I get to allowing charges, so I am thinking it should probably be a different table with shared id column. 
8. I have a crud on charges without value but tied to cards. 
9. Made Card default balance zero, could have been null.
10. I want to show charges on the card.
11. I have a working version that is not pretty. I am going to put out how to get started on machine. 