# music_lib
MUSIC DATABASE PROJECT (ETL)

********************
TEAM MEMBERS
 - Jim Bentley
 - Annabel Cheong

********************
AUDIENCE 
Music Industry of Australia

********************
PURPOSE
The purpose of this project is to obtain music metadata for the Australian Music Industry.

********************
REPOSITORY

This repository contains:

***** FILE: summary.md *****
This includes a summary of the challenges and findings of the ETL project.


***** FILE: music.ipynb *****
This includes the extraction, transformation and loading (including the connection to postgress and loading of data) from the data.csv file (from Kaggle) and from the Spotify API site. 


***** FILE: album.ipynb *****
This includes the extraction, transformation and loading of information from the Top Albums API page. 


***** FILE: schema.ipynb *****
This includes the query to create all the tables with details on the column headings.


***** FILE: queries.ipynb *****
This includes the query to join the tables.
Various views to tailor for specific audience groups.


***** FOLDER: Resources *****

*** Raw Data ***

	- data.csv (spotify csv file from Kaggle)
	https://www.kaggle.com/yamaerenay/spotify-dataset-19212020-160k-tracks?select=data.csv
	Contains: spotify_id, song_name, year, artist, duration
	
	- Spotify API (retrieved via json)
	https://developer.spotify.com/documentation/web-api/reference/#endpoint-get-audio-features
	
	- Top Albums API (retrieved via web scraping)
	rateyourmusic.com/charts/top/album/all-time
	Contains: position,title,artist,release_date,genres,secondarygenres,avg_rating,rating_count,review_count,spotify_link
	
*** Transformed Data ***

	- new_csv.csv
	- timesig.csv
	- albums.csv


Common column to join between data.csv and Spotify API: id
Common column to join between data.csv and Top Albums API: artist

	



