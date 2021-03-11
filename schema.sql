--------------
-- TABLE 1 --
--------------
-- Create table for new_csv_df (from data.csv)
-- NOTES: -- Used s_ prefix eg. s_name, s_year BECAUSE name is already a reserved variable in sql.
          -- id is the spotify id which is unique by the specific song and corresponding artist
CREATE TABLE spotify_csv (
  id VARCHAR PRIMARY KEY,  
  s_name VARCHAR NOT NULL,
  s_artist VARCHAR NOT NULL,
  s_key INT NOT NULL,
  s_tempo INT NOT NULL,
  s_year INT NOT NULL,
  s_popularity INT NOT NULL
);

--------------
-- TABLE 2 --
--------------
-- Create table for spot_api_df (from spotipy API)
CREATE TABLE spotify_api (
id VARCHAR PRIMARY KEY,
s_timesig INT NOT NULL
);

--------------
-- TABLE 3 --  
--------------
-- Create table for album_df (from Rate Your Music web scrape)
CREATE TABLE album (
position INT NOT NULL PRIMARY KEY, 
title VARCHAR NOT NULL, 
artist VARCHAR NOT NULL, 
release_date  VARCHAR, 
genres  VARCHAR,
secondarygenres  VARCHAR, 
avg_rating INT, 
rating_count INT, 
review_count INT,
spotify_link  VARCHAR
);

--------------
-- JOIN TABLES 1 AND 2 --
-- JOIN TABLES 3 to (TABLE 1 AND 2)--
--------------
-- Joins tables

-- ** Add in the t2 column headings 
SELECT t1.id, t1.s_name, t1.s_artist, t1.s_key, t1.s_tempo, t1.s_year, t1.s_popularity, t2.xxxxx, t2.xxxxx
-- **
FROM spotify_csv AS t1
JOIN spotify_api AS t2
ON t1.id = t2.id;



