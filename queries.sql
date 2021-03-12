--------------
-- JOIN TABLES 1 AND 2 --
-- JOIN TABLES 3 to (TABLE 1 AND 2)--
--------------
-- Joins tables

CREATE VIEW ALL_MUSIC AS --Saved as a view 'ALL_MUSIC' in Database

SELECT t1.id, t1.title, t1.artist, t1.key, t1.tempo, t1.year, t1.popularity, t2.timesig
FROM spotify_csv AS t1
JOIN spotify_api AS t2
ON t1.id = t2.id;
  JOIN album as t3
	ON t1.artist=t3.artist;

--QUERY 1--
-- View is made for DJs who require faster, upbeat music with a tempo of 100bpm or more.
-- The selection of columns is tailored for the emerging DJ with speciality interests such as 
-- the song's key, time signature, tempo and popularity amongst the public.

CREATE VIEW Q1 AS --Saved as a view 'Q1' in Database

SELECT title, key, timesig tempo, popularity, year 
FROM ALL_MUSIC
WHERE TEMPO >= 100;


--QUERY 2--
-- View is made for Baby Boomers who want to relive their era through music.
-- The selection of columns is tailored for the every day Baby Boomer who is interested in the title, album (the title is from),

CREATE VIEW Q2 AS --Saved as a view 'Q2' in Database

SELECT title, artist, genre, popularity, year 
FROM ALL_MUSIC
WHERE YEAR BETWEEN 1970 AND 1989;


--QUERY 3--
-- View is made for the musicians who are interested in listening to songs in the top albums.
-- The selection of columns is tailored such that spotify id is included (to allow the user to play the song immediately via spotify),
-- and to view the genre and average rating of the album.

CREATE VIEW Q3 AS --Saved as a view 'Q3' in Database

SELECT id, title, artist, avg_rating, year 
FROM ALL_MUSIC;






