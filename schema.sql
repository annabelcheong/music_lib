--------------
-- TABLE 1 --
--------------
-- Create table for new_csv_df (from data.csv)
-- NOTES: -- Used s_ prefix eg. s_name, s_year BECAUSE name is already a reserved variable in sql.
          -- id is the spotify id which is unique by the specific song and corresponding artist
CREATE TABLE spotify_csv (
  id VARCHAR PRIMARY KEY,  
  title VARCHAR NOT NULL,
  artist VARCHAR NOT NULL,
  key INT NOT NULL,
  tempo INT NOT NULL,
  year INT NOT NULL,
  popularity INT NOT NULL
);

--------------
-- TABLE 2 --
--------------
-- Create table for spot_api_df (from spotipy API)
CREATE TABLE spotify_api (
id VARCHAR PRIMARY KEY,
timesig INT NOT NULL
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
avg_rating DECIMAL, 
rating_count INT, 
review_count INT,
spotify_link  VARCHAR
);