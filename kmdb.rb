# In this assignment, you'll be using the domain model from hw1 (found in the hw1-solution.sql file)
# to create the database structure for "KMDB" (the Kellogg Movie Database).
# The end product will be a report that prints the movies and the top-billed
# cast for each movie in the database.

# To run this file, run the following command at your terminal prompt:
# `rails runner kmdb.rb`

# Requirements/assumptions
#
# - There will only be three movies in the database – the three films
#   that make up Christopher Nolan's Batman trilogy.
# - Movie data includes the movie title, year released, MPAA rating,
#   and studio.
# - There are many studios, and each studio produces many movies, but
#   a movie belongs to a single studio.
# - An actor can be in multiple movies.
# - Everything you need to do in this assignment is marked with TODO!

# Rubric
# 
# There are three deliverables for this assignment, all delivered within
# this repository and submitted via GitHub and Canvas:
# - Generate the models and migration files to match the domain model from hw1.
#   Table and columns should match the domain model. Execute the migration
#   files to create the tables in the database. (5 points)
# - Insert the "Batman" sample data using ruby code. Do not use hard-coded ids.
#   Delete any existing data beforehand so that each run of this script does not
#   create duplicate data. (5 points)
# - Query the data and loop through the results to display output similar to the
#   sample "report" below. (10 points)

# Submission
# 
# - "Use this template" to create a brand-new "hw2" repository in your
#   personal GitHub account, e.g. https://github.com/<USERNAME>/hw2
# - Do the assignment, committing and syncing often
# - When done, commit and sync a final time before submitting the GitHub
#   URL for the finished "hw2" repository as the "Website URL" for the 
#   Homework 2 assignment in Canvas

# Successful sample output is as shown:

# Movies
# ======

# Batman Begins          2005           PG-13  Warner Bros.
# The Dark Knight        2008           PG-13  Warner Bros.
# The Dark Knight Rises  2012           PG-13  Warner Bros.

# Top Cast
# ========

# Batman Begins          Christian Bale        Bruce Wayne
# Batman Begins          Michael Caine         Alfred
# Batman Begins          Liam Neeson           Ra's Al Ghul
# Batman Begins          Katie Holmes          Rachel Dawes
# Batman Begins          Gary Oldman           Commissioner Gordon
# The Dark Knight        Christian Bale        Bruce Wayne
# The Dark Knight        Heath Ledger          Joker
# The Dark Knight        Aaron Eckhart         Harvey Dent
# The Dark Knight        Michael Caine         Alfred
# The Dark Knight        Maggie Gyllenhaal     Rachel Dawes
# The Dark Knight Rises  Christian Bale        Bruce Wayne
# The Dark Knight Rises  Gary Oldman           Commissioner Gordon
# The Dark Knight Rises  Tom Hardy             Bane
# The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
# The Dark Knight Rises  Anne Hathaway         Selina Kyle

# Delete existing data, so you'll start fresh each time this script is run.
# Use `Model.destroy_all` code.
# TODO!

    Actor.destroy_all
    Movie.destroy_all
    Role.destroy_all
    Studio.destroy_all    


# Generate models and tables, according to the domain model.
# TODO!

    #rails generate model Studio
    #rails generate model Movie
    #rails generate model Actor
    #rails generate model Role

    #rails db:migrate

# Insert data into the database that reflects the sample data shown above.
# Do not use hard-coded foreign key IDs.
# TODO!

#Studio

new_studio = Studio.new
new_studio["name"] = "Warner Bros."
new_studio.save

#puts "There are #{Studio.all.count}"

# #Movie

warnerbros = Studio.find_by({"name" => "Warner Bros."})

new_movie = Movie.new
new_movie["title"] = "Batman Begins"
new_movie["year"] = "2005"
new_movie["rated"] = "PG-13"
new_movie["studio_id"] = warnerbros["id"]
new_movie.save

movie2 = Movie.new
movie2["title"] = "The Dark Knight"
movie2["year"] = "2008"
movie2["rated"] = "PG-13"
movie2["studio_id"] = warnerbros["id"]
movie2.save

movie3 = Movie.new
movie3["title"] = "The Dark Knight Rises"
movie3["year"] = "2012"
movie3["rated"] = "PG-13"
movie3["studio_id"] = warnerbros["id"]
movie3.save

#Actors

new_actor = Actor.new
new_actor["name"] = "Christian Bale"
new_actor.save

actor3 = Actor.new
actor3["name"] = "Michael Caine"
actor3.save

actor4 = Actor.new
actor4["name"] = "Liam Neeson"
actor4.save

actor5 = Actor.new
actor5["name"] = "Katie Holmes"
actor5.save

actor6 = Actor.new
actor6["name"] = "Gary Oldman"
actor6.save

actor7 = Actor.new
actor7["name"] = "Heath Ledger"
actor7.save

actor8 = Actor.new
actor8["name"] = "Aaron Eckhart"
actor8.save

actor9 = Actor.new
actor9["name"] = "Maggie Gyllenhaal"
actor9.save

actor10 = Actor.new
actor10["name"] = "Tom Hardy"
actor10.save

actor11 = Actor.new
actor11["name"] = "Joseph Gordon-Levitt"
actor11.save

actor12 = Actor.new
actor12["name"] = "Anne Hathaway"
actor12.save

#Roles

batmanbegins = Movie.find_by({"title" => "Batman Begins"})
darkknight = Movie.find_by({"title" => "The Dark Knight"})
darkrises = Movie.find_by({"title" => "The Dark Knight Rises"})

anne = Actor.find_by({"name" => "Anne Hathaway"})
christian = Actor.find_by({"name" => "Christian Bale"})
michael = Actor.find_by({"name" => "Michael Caine"})
liam = Actor.find_by({"name" => "Liam Neeson"})
katie = Actor.find_by({"name" => "Katie Holmes"})
gary = Actor.find_by({"name" => "Gary Oldman"})
heath = Actor.find_by({"name" => "Heath Ledger"})
aaron = Actor.find_by({"name" => "Aaron Eckhart"})
maggie = Actor.find_by({"name" => "Maggie Gyllenhaal"})
tom = Actor.find_by({"name" => "Tom Hardy"})
joseph = Actor.find_by({"name" => "Joseph Gordon-Levitt"})


new_role = Role.new
new_role["character_name"] = "Bruce Wayne"
new_role["movie_id"] = batmanbegins["id"]
new_role["actor_id"] = christian["id"]
new_role.save

role2 = Role.new
role2["movie_id"] = darkknight["id"]
role2["actor_id"] = christian["id"]
role2["character_name"] = "Bruce Wayne"
role2.save

role3 = Role.new
role3["movie_id"] = darkrises["id"]
role3["actor_id"] = christian["id"]
role3["character_name"] = "Bruce Wayne"
role3.save

role4 = Role.new
role4["movie_id"] = batmanbegins["id"]
role4["actor_id"] = michael["id"]
role4["character_name"] = "Alfred"
role4.save

role5 = Role.new
role5["movie_id"] = darkknight["id"]
role5["actor_id"] = michael["id"]
role5["character_name"] = "Alfred"
role5.save

role6 = Role.new
role6["movie_id"] = batmanbegins["id"]
role6["actor_id"] = liam["id"]
role6["character_name"] = "Ra's Al Ghul"
role6.save

role7 = Role.new
role7["movie_id"] = batmanbegins["id"]
role7["actor_id"] = katie["id"]
role7["character_name"] = "Rachel Dawes"
role7.save

role8 = Role.new
role8["movie_id"] = darkknight["id"]
role8["actor_id"] = maggie["id"]
role8["character_name"] = "Rachel Dawes"
role8.save

role9 = Role.new
role9["movie_id"] = darkknight["id"]
role9["actor_id"] = gary["id"]
role9["character_name"] = "Commissioner Gordon"
role9.save

role10 = Role.new
role10["movie_id"] = darkrises["id"]
role10["actor_id"] = gary["id"]
role10["character_name"] = "Commissioner Gordon"
role10.save

role11 = Role.new
role11["movie_id"] = darkknight["id"]
role11["actor_id"] = heath["id"]
role11["character_name"] = "Joker"
role11.save

role12 = Role.new
role12["movie_id"] = darkknight["id"]
role12["actor_id"] = aaron["id"]
role12["character_name"] = "Harvey Dent"
role12.save

role13 = Role.new
role13["movie_id"] = darkrises["id"]
role13["actor_id"] = tom["id"]
role13["character_name"] = "Bane"
role13.save

role14 = Role.new
role14["movie_id"] = darkrises["id"]
role14["actor_id"] = joseph["id"]
role14["character_name"] = "John Blake"
role14.save

role15 = Role.new
role15["movie_id"] = darkrises["id"]
role15["actor_id"] = anne["id"]
role15["character_name"] = "Selina Kyle"
role15.save

# Prints a header for the movies output
puts "Movies"
puts "======"
puts ""

# Query the movies data and loop through the results to display the movies output.
# TODO!

all_movies = Movie.all
#puts all_movies.inspect

for movie in all_movies
    studio = Studio.find_by({"id" => movie["studio_id"]})
    # puts studio.inspect
    puts "#{movie["title"]} #{movie["year"]} #{movie["rated"]} #{studio["name"]}"
end


# Prints a header for the cast output
puts ""
puts "Top Cast"
puts "========"
puts ""

# Query the cast data and loop through the results to display the cast output for each movie.
# TODO!

all_role = Role.all
#puts all_role.inspect

for role in all_role
    movie = Movie.find_by({"id" => role["movie_id"]})
    actor = Actor.find_by({"id" => role["actor_id"]})
    puts "#{movie["title"]} #{actor["name"]} #{role["character_name"]}"
end 

# all_cast = Actor.all
#puts all_cast.inspect

# for actor in all_cast
#     role = Role.find_by("name" => movie{"name"})
#     puts "#{movie["name"]} #{actor["name"]}"
# end

# for movie in all_movies
#     studio = Studio.find_by({"id" => movie["studio_id"]})
#     # puts studio.inspect
#     puts "#{movie["title"]} #{movie["year"]} #{movie["rated"]} #{studio["name"]}"
# end

# .width 21 20 20

# how to query all roles