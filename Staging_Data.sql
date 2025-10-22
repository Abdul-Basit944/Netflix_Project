Create stage Netflix_Stage
URL = 's3://netflix-dataproject'
CREDENTIALS = (AWS_KEY_ID ='AWS_KEY_ID' , AWS_SECRET_KEY= 'AWS_SECRET_KEY')

Create or replace table raw_movies (
   movieId INTEGER,
   title   STRING,
   genres  STRING
)

COPY INTO raw_movies 
FROM '@NETFLIX_STAGE/movies.csv'
FILE_FORMAT = (TYPE = 'CSV'  SKIP_HEADER = 1 FIELD_OPTIONALLY_ENCLOSED_BY = '"');

Select * from raw_movies;

CREATE OR REPLACE TABLE raw_ratings (
  userId INTEGER,
  movieId INTEGER,
  rating FLOAT,
  timestamp BIGINT
);

COPY INTO raw_ratings
FROM '@NETFLIX_STAGE/ratings.csv'
FILE_FORMAT = (TYPE = 'CSV' SKIP_HEADER = 1 FIELD_OPTIONALLY_ENCLOSED_BY = '"');

-- Load raw_tags
CREATE OR REPLACE TABLE raw_tags (
  userId INTEGER,
  movieId INTEGER,
  tag STRING,
  timestamp BIGINT
);

COPY INTO raw_tags
FROM '@NETFLIX_STAGE/tags.csv'
FILE_FORMAT = (TYPE = 'CSV' SKIP_HEADER = 1 FIELD_OPTIONALLY_ENCLOSED_BY = '"')
ON_ERROR = 'CONTINUE';

-- Load raw_genome_scores
CREATE OR REPLACE TABLE raw_genome_scores (
  movieId INTEGER,
  tagId INTEGER,
  relevance FLOAT
);

COPY INTO raw_genome_scores
FROM '@NETFLIX_STAGE/genome-scores.csv'
FILE_FORMAT = (TYPE = 'CSV' SKIP_HEADER = 1 FIELD_OPTIONALLY_ENCLOSED_BY = '"');

-- Load raw_genome_tags
CREATE OR REPLACE TABLE raw_genome_tags (
  tagId INTEGER,
  tag STRING
);

COPY INTO raw_genome_tags
FROM '@NETFLIX_STAGE/genome-tags.csv'
FILE_FORMAT = (TYPE = 'CSV' SKIP_HEADER = 1 FIELD_OPTIONALLY_ENCLOSED_BY = '"');

-- Load raw_links
CREATE OR REPLACE TABLE raw_links (
  movieId INTEGER,
  imdbId INTEGER,
  tmdbId INTEGER
);

COPY INTO raw_links
FROM '@NETFLIX_STAGE/links.csv'
FILE_FORMAT = (TYPE = 'CSV' SKIP_HEADER = 1 FIELD_OPTIONALLY_ENCLOSED_BY = '"');

select * from raw_links;


