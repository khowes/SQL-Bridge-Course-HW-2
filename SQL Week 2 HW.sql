/*
 SQL Bridge Course Week 2 Assignment - One to Many Relationships
 */
 
DROP TABLE IF EXISTS Videos;
DROP TABLE IF EXISTS Reviewers;

-- Q1 Creat Table of SQL Training Videos

CREATE TABLE Videos
(
  video_id int PRIMARY KEY,
  title varchar(30) NOT NULL,
  length int NOT NULL,
  url varchar(80) NOT NULL
);

INSERT INTO videos ( video_id, title, length, url ) VALUES ( 1, 'MySQL 5 Administration-Part 1', 5, 'https://www.vtc.com');
INSERT INTO videos ( video_id, title, length, url ) VALUES ( 2, 'Learning MySQL', 390, 'http://www.infiniteskills.com');
INSERT INTO videos ( video_id, title, length, url ) VALUES ( 3, 'MySQL Essential Training', 264, 'https://www.lynda.com');

SELECT * FROM Videos;

-- Q2 Create Table of User Reviews of the Training Videos 

CREATE TABLE Reviewers
(
  reviewer_id int ,
  name varchar(5) NOT NULL,
  rating int NOT NULL,
  review varchar(20) NOT NULL,
  video_id int NOT NULL REFERENCES videos,
  PRIMARY KEY (reviewer_id, video_id)
);

INSERT INTO reviewers (reviewer_id, name, rating, review, video_id) VALUES (1, 'Ed', 5, 'Great stuff', 1);
INSERT INTO reviewers (reviewer_id, name, rating, review, video_id) VALUES (1, 'Ed', 1, 'Horrible', 2); 
INSERT INTO reviewers (reviewer_id, name, rating, review, video_id) VALUES (2, 'Sara', 4, 'Very informative', 1);
INSERT INTO reviewers (reviewer_id, name, rating, review, video_id) VALUES (2, 'Sara', 3, 'Just ok', 2); 
INSERT INTO reviewers (reviewer_id, name, rating, review, video_id) VALUES (2, 'Sara', 5, 'Essential', 3); 
INSERT INTO reviewers (reviewer_id, name, rating, review, video_id) VALUES (3, 'Nick', 5, 'Ed knows nothing', 2);
INSERT INTO reviewers (reviewer_id, name, rating, review, video_id) VALUES (3, 'Nick', 5, 'Excellent', 3);

SELECT * FROM Reviewers;

-- Q3 Use JOIN Statement to show info in both tables

SELECT * FROM Videos
LEFT JOIN Reviewers on videos.video_id = reviewers.video_id
ORDER BY videos.video_id, name
