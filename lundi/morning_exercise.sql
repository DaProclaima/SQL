-- IF db exist use next line
-- DROP DATABASE sql_courses;

GRANT ALL PRIVILEGES ON *.* TO 'sqlcourses'@'localhost' IDENTIFIED BY 'sqlcourses';
CREATE DATABASE sql_courses;

-- Exo 1
USE sql_courses;
create table articles(
	articles_id MEDIUMINT UNSIGNED PRIMARY KEY auto_increment,
    title VARCHAR(50) NOT NULL,
    text LONGTEXT,
    released_date DATE,
    author VARCHAR(50),
    topic ENUM('eco', 'sport', 'inter',  'politique', 'culture')
);

-- exo 2: 
USE sql_courses;
CREATE table topics(
	topic_id MEDIUMINT PRIMARY KEY auto_increment,
	title VARCHAR(50) UNIQUE NOT NULL
);
ALTER table topics
CHANGE title title VARCHAR(50) UNIQUE NOT NULL;
INSERT INTO topics (title) VALUES ('eco'), ('sport'), ('inter'), ('politique'), ('culture');

INSERT INTO `articles` (`title`, `text`, `released_date`, `author`, `topics`) 
VALUES ('Amazon Antitrsut ', 'EU antitrust department filed up antitrust charges against Amazon', '2020-06-09', 'Me', 'eco'), 
('Amazon antitrust penalties', 'EU antitrust department filed up antitrust charges against Amazon', '2020-06-01', 'New York Times', 'eco')
;
SELECT *
FROM topics
INNER JOIN articles ON topics.title= articles.topic;

SELECT *
FROM articles
INNER JOIN topics ON articles.topic= topics.title;

-- Exo 3: Adapt articles table and joins new topics table

USE sql_courses;
ALTER table articles
CHANGE topic topic_id MEDIUMINT NOT NULL;

SELECT * FROM topics;

INSERT INTO `articles` (`title`, `text`, `released_date`, `author`, `FK_topic_id`) VALUES ( 'title', 'text', NOW(), 'Sébastien', 1);

-- WRONG CODE L.52-L.59 + CORRECTION L.60
-- CREATE table articles_topics_junction(
--   articles_id MEDIUMINT,
--   topics=_id MEDIUMINT,
--   CONSTRAINT articles_topics_pk PRIMARY KEY (articles_id, topics_id),
--   CONSTRAINT FK_articles FOREIGN KEY (articles_id) REFERENCES articles (articles_id),
--   CONSTRAINT FK_topics= FOREIGN KEY (topics_id) REFERENCES topics (topics_id)
-- );
ALTER TABLE articles 
ADD FOREIGN KEY (FK_topic_id) REFERENCES topics(topic_id);

