-- Analysis of Netflix original films and documentary released as of June 1st, 2021. 

SELECT * FROM final_project.imdb_scores;
SELECT * FROM final_project.netflix_movies;

-- Count all rows in netflix movies table
SELECT COUNT(*) AS NumberOfRows FROM final_project.netflix_movies;

-- Count all rows in netflix movies table where runtime >90
SELECT COUNT(*) AS NumberOfRows FROM final_project.netflix_movies
WHERE Runtime>90;

-- Count no of rows on every column in netflix movies table
SELECT COUNT(Title) AS NumberofTitle,  COUNT(Genre) AS NumberofGenre, COUNT(Premiere) AS NumberofPremiere, COUNT(Runtime) AS NumberofRuntime, COUNT(Language) AS NumberofLanguage
FROM final_project.netflix_movies;

-- Find Average runtime of movies from netflix movies table
SELECT ROUND(AVG(Runtime),2) AS AverageRuntime FROM final_project.netflix_movies;

-- Find average score of Documentary
SELECT Genre, AVG(Runtime) FROM final_project.netflix_movies
WHERE Genre='Documentary';

-- Find average score by Genres >120
SELECT Genre, AVG(Runtime)
FROM final_project.netflix_movies
GROUP BY Genre
HAVING AVG(Runtime)>120;

-- Average of IMDB scores
SELECT ROUND(AVG(IMDB_Score),2) AS AverageIMDB_Score FROM final_project.imdb_scores;

-- Sum of all runtime
SELECT SUM(Runtime) FROM final_project.netflix_movies;

-- Sum of all IMDB scores > 7.5
SELECT SUM(IMDB_Score) FROM final_project.imdb_scores
WHERE IMDB_Score>7.5;

-- Highest rated movie
SELECT Title, MAX(IMDB_score) FROM final_project.imdb_scores;

-- Lowest rated movie
SELECT Title, MIN(IMDB_score) FROM final_project.imdb_scores;

SELECT * FROM final_project.imdb_scores;
SELECT * FROM final_project.netflix_movies;

-- Combining database together based on Title
SELECT Movies.Title, Movies.Genre, Movies.Premiere, Movies.Runtime, Movies.Language, Scores.IMDB_Score
FROM final_project.netflix_movies Movies
JOIN final_project.imdb_scores Scores
ON Movies.Title = Scores.Title;

--  Top 5 Movies with the highest rating score per Genre
SELECT Movies.Title, MAX(IMDB_Score), Movies.Genre
FROM final_project.netflix_movies Movies
JOIN final_project.imdb_scores Scores
ON Movies.Title = Scores.Title
GROUP BY Movies.Genre
ORDER BY MAX(IMDB_Score) Desc
Limit 5;

-- 5 Movie with the Lowest rating score per Genre
SELECT Movies.Title, Movies.Genre, MIN(IMDB_Score)
FROM final_project.netflix_movies Movies
INNER JOIN final_project.imdb_scores Scores
ON Movies.Title = Scores.Title
GROUP BY Movies.Genre
ORDER BY MIN(IMDB_Score) ASC
Limit 5;

-- Movies in English Language with runtime >100
SELECT * FROM final_project.netflix_movies
WHERE Language='English' AND Runtime>100;

-- Movies in English and Spanish
SELECT * FROM final_project.netflix_movies
WHERE Language='English' OR Language='Spanish';

-- Top 10 Most common film language
SELECT Movies.Language, COUNT(Language) 
FROM final_project.netflix_movies Movies
GROUP BY Language
ORDER BY COUNT(Language) DESC
LIMIT 10;

-- Top 10 Least common film language
SELECT Movies.Language, COUNT(Language) 
FROM final_project.netflix_movies Movies
GROUP BY Language
ORDER BY COUNT(Language) ASC
LIMIT 10;

-- TOP 15 Highest movie runtime per language and Genre
SELECT * FROM final_project.netflix_movies;
SELECT Movies.Language, Movies.Runtime, Movies.Genre
FROM final_project.netflix_movies Movies
GROUP BY Movies.Language
ORDER BY Movies.Runtime DESC
LIMIT 15;

-- Relationship between Runtime and IMDB

SELECT Movies.Title, Movies.Runtime, Scores.IMDB_Score
FROM final_project.netflix_movies Movies
JOIN final_project.imdb_scores Scores
ON Movies.Title = Scores.Title;