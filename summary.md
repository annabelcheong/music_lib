## SUMMARY

- Challenges encountered via the ETL process.
- Findings of the derived results.


Music topic selected as it is relatable to a vast audience, regardless of age or ethnicity. Spotify is primary used in the data collection process because is deemed a reliable source (with more than 144 million subscribers around the world who pay for the service) and is a source with extensive music data. 

*************************
## EXTRACTING DATA
*************************

### data.csv 
This dataset was extracted from the gaggle website:
https://www.kaggle.com/yamaerenay/spotify-dataset-19212020-160k-tracks?select=data.csv

The data includes all the songs on Spotify (more than 170,000 songs ie. more than 170,000 rows of data) and contains the following column headings:  acousticness, artists, danceability, duration_ms, energy, explicit,id, instrumentalness, key, liveness, loudness, mode, name, popularity, release_date, speechiness, tempo, valence, year.

### Spotify API
This data was extracted from the Spotify API website:
https://developer.spotify.com/documentation/web-api/reference/#endpoint-get-audio-features

A .gitignore folder and a config.py file was created and added as the file to ignore on the repository. The config.py file contains the Spotify user credentials (Spotify user id and the password). Spotify user credentials are required to be verified to successfully retrieve the Spotify json information.

The audio features API website provides a lot of content for each song (Spotify id) provided. Thus, in order to take the audio features information of all songs on Spotify, a for loop was created to loop through the data.csv's id entries. 

A list was created to store only selected information from audio features. This was the Spotify id (unique song) and the time signature for the song. 

One of the major challenges was that it is extremely time consuming to extract 170,000 rows. Furthermore, despite the try and except code in place, the Spotify API still stopped running due to KeyError: 'id'. If more time was provided, the 170,000 rows could be looped in sections and saved periodically after each section has run. 

The extraction process was able to only extract out 9477 rows before faulting.

### albums
Album data was obtained from the following web page (URL):
https://rateyourmusic.com/charts/top/album/all-time/#results

This website has no working api's, so the top albums of all time were extracted using web scrapping methods.
Rate your Music dot com allows anyone to create an account, then submit ratings to albums they have listened to. 

The URL used, provides a list of albums sorted from the most popular album.  This is based on an average of the rating provided by all users that have rated each album.

Each page lists 40 albums in rating order i.e. the first page lists albums 1 to 40.  A user can then press next to view the next 40 albums.

All up there is 125 pages.  This equates to a list of the top rated 5000 albums of all time.

Each album listing displays the follwing attributes about that album:
- Album title, artist, image and release date
- A general and a secondary list of genres
- A rating summary of users who have provided a rating.  This includes an average rating, total of all ratings and a total number of reviews
- A link to Spotify, Youtube, Sound Cloud and Apple Music for each album.

The project requires a link to Spotify music only.  Not every album listed has a link to Spotify.  Therefore, 4531 record were scrapped from the URL.

Extraction code can be found in a Jupyter notebook named album.ipynb

![Alt text](/images/rateyourmusic.png?raw=true "Rate Your Music")

************************* 
## TRANSFORMING DATA
*************************

### data.csv 
As the Spotify id is unique to the specific song and artist, the rows which contained the same ids were removed in the pandas dataframe. Via using the code: new_csv_df.info(), the number of rows before the clean and after the clean are as follows:
	# There are 174389 row entries before drop duplicates
	# There are 172230 row entries after drop duplicates 
The data indicates there were approximately 1% Spotify ids duplicated. 

Only a selection of columns were chosen to best tailor for our target audience. One of our target audience are DJs, so the song's tempo, time signature and artist were variables that were kept. Another target audience are baby boomers. Baby boomers are presumably interested in music of their era, so thinking a step ahead, to filter for the song year, the column 'year' (year of release) was kept in the analysis.


### Spotify API
The transformation is already mostly covered in the Extraction section. Further transformation such as converting the saved list (with Spotify id and time signature columns) to a pandas dataframe was done. Subsequenty, the conversion of the dataframe to a csv file.


### albums
Fields extracted from the web site were initially stored in Pandas dataframe ready for transformation.  The following fields required transformation:
- Position - Each position in the chart included a full stop.  The full stop was removed.
- Release Date - End of line characters were removed.  The column was left as a string because not every entry was uniform to a date format.  For example, 4 January 1970, May 2005, 6 November 1983 Live Event.
- Genres - remove end of line characters    
- Secondary Genres - remove end of line characters
- Rating Count - convert to a number and remove comma
- Review Count - convert to a number and remove comma

Finally, the position in the chart was set as the index.

## Overall 
All final data frames were converted to a csv file and saved in the resources folder of the repository. This provides an option for the user in allowing them to load the data on postgres database via the transformed data available in csv format.


**************************
## LOADING DATA
**************************

Firstly, 3 tables were created in the postgres database.

- data.csv 
- Spotify API 
- albums

In order to load the data, the table headings created (as per the schema.sql file) before loading the data matched the headings in the final dataframe/csv produced.

There are 2 methods of loading the data, and both the options are provided. 
First method: Directly connect to postgres and upload the final dataframes to the tables.
Second method: Saved the final dataframe as a csv file.

When the csv files are exported, no index (index=False) was requested in the code. This is to ensure a successful load into the postgres database. 
eg. id_timesig_df.to_csv('resources/timesig.csv', index=False)

Note: Recommendation to load the data via sqlalchemy and connect with the postgres database. Due to the apostrophes and commas being a part of the actual title and artist entries, importing data via the csv file confuses the database and the load may fail. 

### Overall (Joins)
In order to successfully join the columns, the column title that was joined on was consistent amongst the 3 tables that were created.

#### Queries  (Refer to queries.sql)
Views are created in queries.sql, subsequent to joining the tables.
Each view created is to serve a particular audience type. These were created based on assumed interests:
- Specific columns were selected and 
- Specific filters were used within columns 

For example, 
View 'q1' is made for DJs who require faster, upbeat music with a tempo of 100bpm or more. The selection of columns is tailored for the emerging DJ with speciality interests such as the song's key, time signature, tempo and popularity amongst the public.

See queries.sql for all queries and its target audience.