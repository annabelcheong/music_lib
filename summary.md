SUMMARY

- Challenges encountered via the ETL process.
- Findings of the derived results.


Music topic selected as it is relatable to a vast audience, regardless of age or ethnicity. Spotify is primary used in the data collection process because is deemed a reliable source (with more than 144 million subscribers around the world who pay for the service) and is a source with extensive music data. 

******************
EXTRACTING DATA
******************

**** data.csv ****
This dataset was extracted from the gaggle website:
https://www.kaggle.com/yamaerenay/spotify-dataset-19212020-160k-tracks?select=data.csv

The data includes all the songs on Spotify (more than 170,000 songs ie. more than 170,000 rows of data) and contains the following column headings:  acousticness, artists, danceability, duration_ms, energy, explicit,id, instrumentalness, key, liveness, loudness, mode, name, popularity, release_date, speechiness, tempo, valence, year.

*** Spotify API ***
This data was extracted from the Spotify API website:
https://developer.spotify.com/documentation/web-api/reference/#endpoint-get-audio-features

A .gitignore folder and a config.py file was created and added as the file to ignore on the repository. The config.py file contains the Spotify user credentials (Spotify user id and the password). Spotify user credentials are required to be verified to successfully retrieve the Spotify json information.

The audio features API website provides a lot of content for each song (Spotify id) provided. Thus, in order to take the audio features information of all songs on Spotify, a for loop was created to loop through the data.csv's id entries. 

A list was created to store only selected information from audio features. This was the Spotify id (unique song) and the time signature for the song. 

One of the major challenges was that it is extremely time consuming to extract 170,000 rows and despite the try and except code in place, it still stopped running due to KeyError: 'id'. 

The extraction process was able to only extract out 9477 rows before faulting.

*** albums ***


*************** Jim to add to ***************



******************
TRANSFORMING DATA
******************

**** data.csv ****
As the Spotify id is unique to the specific song and artist, the rows which contained the same ids were removed in the pandas dataframe. Via using the code: new_csv_df.info(), the number of rows before the clean and after the clean are as follows:
	# There are 174389 row entries before drop duplicates
	# There are 172230 row entries after drop duplicates 
The data indicates there were approximately 1% Spotify ids duplicated. 

Only a selection of columns were chosen to best tailor for our target audience. One of our target audience are DJs, so the song's tempo, time signature and artist were variables that were kept. Another target audience are baby boomers. Baby boomers are presumably interested in music of their era, so thinking a step ahead, to filter for the song year, the column 'year' (year of release) was kept in the analysis.


*** Spotify API ***
The transformation is already mostly covered in the Extraction section. Further transformation such as converting the saved list (with Spotify id and time signature columns) to a pandas dataframe was done. Subsequenty, the conversion of the dataframe to a csv file.


*** albums ***

*************** Jim to add to ***************



*** Overall ***
All final data frames were converted to a csv file and saved in the resources folder of the repository. This provides an option for the user in allowing them to load the data on postgres database via the transformed data available in csv format.


*************** Jim to add to ***************


******************
LOADING DATA
******************

Firstly, 3 tables were created in the postgres database.

**** data.csv **** *** Spotify API *** *** albums ***

In order to load the data, the table headings created (as per the schema.sql file) before loading the data matched the headings in the final dataframe/csv produced.

There are 2 methods of loading the data, and both the options are provided. 
First method: Directly connect to postgres and upload the final dataframes to the tables.
Second method: Saved the final dataframe as a csv file.

Note that when the csv files are exported, no index (index=False) was requested in the code. This is to ensure a successful load into the postgres database. 
eg. new_csv_df.to_csv('resources/new_csv.csv', index=False)

*** Overall (Joins) ***
In order to successfully join the columns, the column title that was joined on was consistent amongst the 3 tables that were created.

** Queries *** (Refer to queries.sql)
Views are created in queries.sql, subsequent to joining the tables.
Each view created is to serve a particular audience type. These were created based on assumed interests:
- Specific columns were selected and 
- Specific filters were used within columns 

For example, 
View 'q1' is made for DJs who require faster, upbeat music with a tempo of 100bpm or more. The selection of columns is tailored for the emerging DJ with speciality interests such as the song's key, time signature, tempo and popularity amongst the public.

See queries.sql for all queries and its target audience.





