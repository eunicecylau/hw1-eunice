-- In this assignment, you'll be building the domain model, database 
-- structure, and data for "KMDB" (the Kellogg Movie Database).
-- The end product will be a report that prints the movies and the 
-- top-billed cast for each movie in the database.

-- Requirements/assumptions
--
-- - There will only be three movies in the database – the three films
--   that make up Christopher Nolan's Batman trilogy.
-- - Movie data includes the movie title, year released, MPAA rating,
--   and studio.
-- - There are many studios, and each studio produces many movies, but
--   a movie belongs to a single studio.
-- - An actor can be in multiple movies.
-- - Everything you need to do in this assignment is marked with TODO!
-- - Note rubric explanation for appropriate use of external resources.

-- User stories
--
-- - As a guest, I want to see a list of movies with the title, year released,
--   MPAA rating, and studio information.
-- - As a guest, I want to see the movies which a single studio has produced.
-- - As a guest, I want to see each movie's cast including each actor's
--   name and the name of the character they portray.
-- - As a guest, I want to see the movies which a single actor has acted in.
-- * Note: The "guest" user role represents the experience prior to logging-in
--   to an app and typically does not have a corresponding database table.


-- Deliverables
-- 
-- There are three deliverables for this assignment, all delivered via
-- this file and submitted via GitHub and Canvas:
-- - A domain model, implemented via CREATE TABLE statements for each
--   model/table. Also, include DROP TABLE IF EXISTS statements for each
--   table, so that each run of this script starts with a blank database.
-- - Insertion of "Batman" sample data into tables.
-- - Selection of data, so that something similar to the sample "report"
--   below can be achieved.

-- Rubric
--
-- 1. Domain model - 6 points
-- - Think about how the domain model needs to reflect the
--   "real world" entities and the relationships with each other. 
--   Hint #1: It's not just a single table that contains everything in the 
--   expected output. There are multiple real world entities and
--   relationships including at least one many-to-many relationship.
--   Hint #2: Do NOT name one of your models/tables “cast” or “casts”; this 
--   is a reserved word in sqlite and will break your database! Instead, 
--   think of a better word to describe this concept; i.e. the relationship 
--   between an actor and the movie in which they play a part.
-- 2. Execution of the domain model (CREATE TABLE) - 4 points
-- - Follow best practices for table and column names
-- - Use correct data column types (i.e. TEXT/INTEGER)
-- - Use of the `model_id` naming convention for foreign key columns
-- 3. Insertion of data (INSERT statements) - 4 points
-- - Insert data into all the tables you've created
-- - It actually works, i.e. proper INSERT syntax
-- 4. "The report" (SELECT statements) - 6 points
-- - Write 2 `SELECT` statements to produce something similar to the
--   sample output below - 1 for movies and 1 for cast. You will need
--   to read data from multiple tables in each `SELECT` statement.
--   Formatting does not matter.
-- 5. Using external resources for help with the assignment (including colleagues, AI, internet search, etc):
-- - Engineers look to colleagues and the internet all the time when building software.
--   You are welcome to do the same. However, the solution you submit must utilize
--   the skills and strategies covered in class. Alternate solutions which do not demonstrate
--   an understanding of the approaches used in class will receive significant deductions.
--   Any concern should be raised with faculty prior to assignment due date.

-- Submission
-- 
-- - "Use this template" to create a brand-new "hw1" repository in your
--   personal GitHub account, e.g. https://github.com/<USERNAME>/hw1
-- - Do the assignment, committing and syncing often
-- - When done, commit and sync a final time, before submitting the GitHub
--   URL for the finished "hw1" repository as the "Website URL" for the 
--   Homework 1 assignment in Canvas

-- Successful sample output is as shown:

-- Movies
-- ======

-- Batman Begins          2005           PG-13  Warner Bros.
-- The Dark Knight        2008           PG-13  Warner Bros.
-- The Dark Knight Rises  2012           PG-13  Warner Bros.

-- Top Cast
-- ========

-- Batman Begins          Christian Bale        Bruce Wayne
-- Batman Begins          Michael Caine         Alfred
-- Batman Begins          Liam Neeson           Ra's Al Ghul
-- Batman Begins          Katie Holmes          Rachel Dawes
-- Batman Begins          Gary Oldman           Commissioner Gordon
-- The Dark Knight        Christian Bale        Bruce Wayne
-- The Dark Knight        Heath Ledger          Joker
-- The Dark Knight        Aaron Eckhart         Harvey Dent
-- The Dark Knight        Michael Caine         Alfred
-- The Dark Knight        Maggie Gyllenhaal     Rachel Dawes
-- The Dark Knight Rises  Christian Bale        Bruce Wayne
-- The Dark Knight Rises  Gary Oldman           Commissioner Gordon
-- The Dark Knight Rises  Tom Hardy             Bane
-- The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
-- The Dark Knight Rises  Anne Hathaway         Selina Kyle

-- Turns column mode on but headers off
.mode column
.headers off

-- Drop existing tables, so you'll start fresh each time this script is run.
DROP TABLE IF EXISTS movie;
DROP TABLE IF EXISTS studio;
DROP TABLE IF EXISTS role;
DROP TABLE IF EXISTS actor;

-- Create new tables, according to your domain model
CREATE TABLE movie (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  movie_name TEXT,
  year_released INTEGER,
  MPAA_rating TEXT,
  studio_id INTEGER
);

CREATE TABLE studio (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  studio_name TEXT
);

CREATE TABLE role (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  role_name TEXT,
  movie_id INTEGER,
  actor_id INTEGER
);

CREATE TABLE actor (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  actor_name TEXT
);

-- Insert data into your database that reflects the sample data shown above
-- Use hard-coded foreign key IDs when necessary
-- TODO!


-- INSERT INTO MOVIE TABLE

INSERT INTO movie (movie_name, year_released, MPAA_rating, studio_id)
VALUES ("Batman Begins", 2005, "PG-13", 1);

INSERT INTO movie (movie_name, year_released, MPAA_rating, studio_id)
VALUES ("The Dark Knight", 2008, "PG-13", 1);

INSERT INTO movie (movie_name, year_released, MPAA_rating, studio_id)
VALUES ("The Dark Knight Rises", 2012, "PG-13", 1);

-- INSERT INTO STUDIO TABLE

INSERT INTO studio (studio_name)
VALUES ("Warner Bros");

-- INSERT INTO ROLE TABLE

INSERT INTO role (role_name, movie_id, actor_id)
VALUES ("Bruce Wayne", 1, 1);

INSERT INTO role (role_name, movie_id, actor_id)
VALUES ("Bruce Wayne", 2, 1);

INSERT INTO role (role_name, movie_id, actor_id)
VALUES ("Bruce Wayne", 3, 1);

INSERT INTO role (role_name, movie_id, actor_id)
VALUES ("Alfred", 1, 2);

INSERT INTO role (role_name, movie_id, actor_id)
VALUES ("Alfred", 2, 2);

INSERT INTO role (role_name, movie_id, actor_id)
VALUES ("Ra's Al Ghul", 1, 3);

INSERT INTO role (role_name, movie_id, actor_id)
VALUES ("Rachel Dawes", 1, 4);

INSERT INTO role (role_name, movie_id, actor_id)
VALUES ("Rachel Dawes", 2, 8);

INSERT INTO role (role_name, movie_id, actor_id)
VALUES ("Commissioner Gordon", 1, 5);

INSERT INTO role (role_name, movie_id, actor_id)
VALUES ("Commissioner Gordon", 3, 5);

INSERT INTO role (role_name, movie_id, actor_id)
VALUES ("Joker", 2, 6);

INSERT INTO role (role_name, movie_id, actor_id)
VALUES ("Harvey Dent", 2, 7);

INSERT INTO role (role_name, movie_id, actor_id)
VALUES ("Bane", 3, 9);

INSERT INTO role (role_name, movie_id, actor_id)
VALUES ("John Blake", 3, 10);

INSERT INTO role (role_name, movie_id, actor_id)
VALUES ("Selina Kyle", 3, 11);

-- INSERT INTO ACTOR TABLE

INSERT INTO actor (actor_name)
VALUES ("Christian Bale");

INSERT INTO actor (actor_name)
VALUES ("Michael Caine");

INSERT INTO actor (actor_name)
VALUES ("Liam Neeson");

INSERT INTO actor (actor_name)
VALUES ("Katie Holmes");

INSERT INTO actor (actor_name)
VALUES ("Gary Oldman");

INSERT INTO actor (actor_name)
VALUES ("Heath Ledger");

INSERT INTO actor (actor_name)
VALUES ("Aaron Eckhart");

INSERT INTO actor (actor_name)
VALUES ("Maggie Gyllenhaal");

INSERT INTO actor (actor_name)
VALUES ("Tom Hardy");

INSERT INTO actor (actor_name)
VALUES ("Joseph Gordon-Levitt");

INSERT INTO actor (actor_name)
VALUES ("Anne Hathaway");    

-- Prints a header for the movies output
.print "Movies"
.print "======"
.print ""

-- The SQL statement for the movies output
-- TODO!

SELECT movie.movie_name, movie.year_released, movie.MPAA_rating, studio.studio_name
FROM movie INNER JOIN studio
ON movie.studio_id = studio.id;

-- Prints a header for the cast output
.print ""
.print "Top Cast"
.print "========"
.print ""

-- The SQL statement for the cast output
-- TODO!

SELECT movie.movie_name, actor.actor_name, role.role_name
FROM role
INNER JOIN actor ON role.actor_id = actor.id
INNER JOIN movie ON role.movie_id = movie.id
ORDER BY role.movie_id ASC, role.actor_id ASC;

